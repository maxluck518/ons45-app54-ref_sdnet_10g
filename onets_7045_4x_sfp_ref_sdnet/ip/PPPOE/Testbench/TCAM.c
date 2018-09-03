/***************************** Include Files *********************************/
#include <stdio.h>
#include <string.h>
#include "TCAM.h"

void tcam_wait_for_update_ack(TCAM_CONTEXT* cx);

int tcam_convert_hex_string_to_uint_array( const char *in_buf, uint32_t *out_buf, int out_arr_size);

unsigned int tcam_ChartoInt(char c);

//int tcam_convert_uint_array_to_hex_string( uint32_t *in_buf, char *out_buf, int in_arr_size);

//int tcam_uint_to_str(uint32_t val, char *out_buf, int radix);

/*
Arguments   : None
return      : uint32_t (an integer indicating the size of the memory space in bytes)
Description : This function returns the TCAM_ADDR_SIZE and can be called at runtime to dynamically 
              allocate or resize the configuration memory mapping of the TCAM instance
*/
uint32_t TCAM_Init_GetAddrSize()
{
    return TCAM_ADDR_SIZE;
}

/*
Arguments   : cx - A pointer to the TCAM_CONTEXT structure to be initialized
              base - starting offset of the configuration memory address range assigned to this TCAM instance
              size - size in bytes of the configuration memory address range assigned to this TCAM instance
              max_depth - maximum number of entries that can be stored in the TCAM
              key_width - width of the entry key in bits
              value_width - width of the entry value in bits
              num_ranges - number of numeric [min:max] range sub-fields within the key
              range_width - width of the numeric sub-fields
              range_offset - bit position of the LSB of the first range sub-field within the key
              *register_write - pointer to the register write function.
              *register_read - pointer to the register read function.
              *log_message - pointer to the formatted output log function.
              log_level - verbosity level.
return      : int (An integer indicating success or an error code)
Description : This function creates the instance context data structure
*/
int TCAM_Init_ValidateContext(
TCAM_CONTEXT* cx,
uint32_t base,
uint32_t size,
uint32_t max_depth,
uint32_t key_width,
uint32_t value_width,
uint32_t num_ranges,
uint32_t range_width,
uint32_t range_offset,
void (*register_write)(uint32_t addr, uint32_t data),
uint32_t (*register_read)(uint32_t addr),
int(*log_message)(const char * format),
uint32_t log_level
)
{
    if(size >= TCAM_ADDR_SIZE)
    {
        if(register_write != NULL && register_read != NULL && log_message != NULL)
        {
            cx->base = base;
            cx->max_depth = max_depth;
            cx->key_width = key_width;
            cx->value_width = value_width;
            cx->num_ranges = num_ranges;
            cx->range_width = range_width;
            cx->range_offset = range_offset;
            cx->log_level = log_level;
            cx->register_write = register_write;
            cx->register_read = register_read;
            return TCAM_SUCCESS;
        }
        else
        {
            return TCAM_ERROR_INIT_NULL_FUNCPTR;
        }
    }
    else
    {
        return TCAM_ERROR_INIT_SIZE;
    }
}

/*
Arguments   : cx - A pointer to the TCAM_CONTEXT structure to be updated
              log_level - A new logging level
return      : int (An integer indicating success or an error code)
Description : This function updates the logging level in the device context data structure.
*/
int TCAM_Init_SetLogLevel(TCAM_CONTEXT* cx, uint32_t log_level)
{
    if(cx != NULL)
    {
        cx->log_level = log_level;
        return TCAM_SUCCESS;
    }
    else
    {
        return TCAM_ERROR_NULL_CONTEXT_PTR;
    }
}

/*
Arguments   : cx - A pointer to the TCAM_CONTEXT structure
return      : int (An integer indicating success or an error code)
Description : This function performs device self-initialization, erasing and invalidating all stored rules
*/
int TCAM_Init_Activate(TCAM_CONTEXT* cx)
{
    uint32_t data=0;
    TCAM_DEVICE * dev = (TCAM_DEVICE *)cx->base;
    if(cx != NULL)
    {
        op_type = init;
        data = ((op_type << TCAM_UPDATE_REQ_OP_OFFSET) & TCAM_UPDATE_REQ_OP_MASK);
        cx->register_write((uint32_t)&dev->update_req,data);
        //wait for update ACK
        tcam_wait_for_update_ack(cx);
        return TCAM_SUCCESS;
    }
    else
    {
        return TCAM_ERROR_NULL_CONTEXT_PTR;
    }
}

/*
Arguments   : cx - A pointer to the TCAM_CONTEXT structure
              addr - TCAM location to write
              data - A pointer to a null-terminated C string encoding the key in hexadecimal
              mask - A pointer to a null-terminated C string encoding the mask in hexadecimal
              value - A pointer to a null-terminated C string encoding the value in hexadecimal
return      : int (An integer indicating success or an error code)
Description : This function writes a valid entry into the TCAM
*/
int TCAM_Mgt_WriteEntry(TCAM_CONTEXT* cx, uint32_t addr, const char* data, const char* mask, const char* value)
{
    uint32_t wr_data=0;
    int i =0;
    int no_of_key_regs = (cx->key_width%32 == 0) ? (cx->key_width/32) : ((cx->key_width/32)+1);
    int no_of_value_regs = (cx->value_width%32 == 0) ? (cx->value_width/32) : ((cx->value_width/32)+1);
    uint32_t key_arr[no_of_key_regs];
    uint32_t mask_arr[no_of_key_regs];
    uint32_t value_arr[no_of_value_regs];
    uint32_t *key_buf;
    uint32_t *mask_buf;
    uint32_t *value_buf;

    //Initialize arrays
    for(i=0;i<no_of_key_regs;i++)
    {
        key_arr[i]=0;
        mask_arr[i]=0;
    }
    for(i=0;i<no_of_value_regs;i++)
    {
        value_arr[i]=0;
    }

    //  Assign the starting address
    key_buf = &key_arr[0];
    mask_buf = &mask_arr[0];
    value_buf = &value_arr[0];  
    TCAM_DEVICE * dev = (TCAM_DEVICE *)cx->base;
    if(cx != NULL && data != NULL && mask != NULL && value != NULL)
    {
        if(tcam_convert_hex_string_to_uint_array(data, key_buf, no_of_key_regs) != 0)
            return TCAM_ERROR_KEY_FORMAT;
        if(tcam_convert_hex_string_to_uint_array(mask, mask_buf, no_of_key_regs) != 0)
            return TCAM_ERROR_MASK_FORMAT;
        if(tcam_convert_hex_string_to_uint_array(value, value_buf, no_of_value_regs) != 0)
            return TCAM_ERROR_VALUE_FORMAT;   
        //write key & mask registers  
        for(i=0;i<no_of_key_regs;i++)
        {
            cx->register_write((uint32_t)&dev->data[i],*key_buf);
            key_buf++;
            cx->register_write((uint32_t)&dev->mask[i],*mask_buf);
            mask_buf++;
        }        
        //write value registers
        for(i=0;i<no_of_value_regs;i++)
        {
            cx->register_write((uint32_t)&dev->value[i],*value_buf);
            value_buf++;
        }      
        //valid
        wr_type = insert; //insert
        wr_data = wr_type; 
        cx->register_write((uint32_t)&dev->valid,wr_data);
        //wait for update ACK
        tcam_wait_for_update_ack(cx);
        //update request
        op_type = write;
        wr_data = ((op_type << TCAM_UPDATE_REQ_OP_OFFSET) & TCAM_UPDATE_REQ_OP_MASK) | ((addr << TCAM_UPDATE_REQ_ADDR_OFFSET) & TCAM_UPDATE_REQ_ADDR_MASK);
        cx->register_write((uint32_t)&dev->update_req,wr_data);
        //wait for update ACK
        tcam_wait_for_update_ack(cx);
        return TCAM_SUCCESS;
               
    }
    else
    {
        if(cx == NULL)
            return TCAM_ERROR_NULL_CONTEXT_PTR;
        else if(data == NULL)
            return TCAM_ERROR_KEY_NULL;
        else if(mask == NULL)
            return TCAM_ERROR_MASK_NULL;
        else
            return TCAM_ERROR_VALUE_NULL;
    }
}

/*
Arguments   : cx - A pointer to the TCAM_CONTEXT structure
              addr - TCAM location to Erase
return      : int (An integer indicating success or an error code)
Description : This function invalidates(removes) an entry in the TCAM.
*/
int TCAM_Mgt_EraseEntry (TCAM_CONTEXT* cx, uint32_t addr)
{
    uint32_t data=0;
    TCAM_DEVICE * dev = (TCAM_DEVICE *)cx->base;
    if(cx != NULL)
    {
        //valid 
        wr_type = erase; //remove
        data = wr_type; 
        cx->register_write((uint32_t)&dev->valid,data);
        //wait for update ACK
        tcam_wait_for_update_ack(cx);
        //update request
        op_type = write;
        data = ((op_type << TCAM_UPDATE_REQ_OP_OFFSET) & TCAM_UPDATE_REQ_OP_MASK) | ((addr << TCAM_UPDATE_REQ_ADDR_OFFSET) & TCAM_UPDATE_REQ_ADDR_MASK);
        cx->register_write((uint32_t)&dev->update_req,data);
        //wait for update ACK
        tcam_wait_for_update_ack(cx);
        return TCAM_SUCCESS;
    }
    else
    {
        return TCAM_ERROR_NULL_CONTEXT_PTR;
    }
}

/*
Arguments   : cx - A pointer to the TCAM_CONTEXT structure
              addr - TCAM location to read
              data - A pointer to a null-terminated C string encoding the key in hexadecimal.
              mask - A pointer to a null-terminated C string encoding the mask in hexadecimal.
              value - A pointer to a null-terminated C string encoding the value in hexadecimal.
return      : int (An integer indicating success or an error code)
Description : This function verifies whether an entry exists in TCAM
*/
int TCAM_Mgt_VerifyEntry(TCAM_CONTEXT* cx, uint32_t addr, const char* data, const char* mask, const char* value)
{
    uint32_t wr_data=0;
    int i = 0;
    int no_of_key_regs = (cx->key_width%32 == 0) ? (cx->key_width/32) : ((cx->key_width/32)+1);
    int no_of_value_regs = (cx->value_width%32 == 0) ? (cx->value_width/32) : ((cx->value_width/32)+1);
    uint32_t key_arr_exp[no_of_key_regs];
    uint32_t mask_arr_exp[no_of_key_regs];
    uint32_t value_arr_exp[no_of_value_regs];
    uint32_t *key_buf_exp;
    uint32_t *mask_buf_exp;
    uint32_t *value_buf_exp;  
    uint32_t key_arr_act[no_of_key_regs];
    uint32_t mask_arr_act[no_of_key_regs];
    uint32_t value_arr_act[no_of_value_regs];
    uint32_t *key_buf_act;
    uint32_t *mask_buf_act;
    uint32_t *value_buf_act; 


    //Initialize arrays
    for(i=0;i<no_of_key_regs;i++)
    {
        key_arr_exp[i]=0;
        mask_arr_exp[i]=0;
    }
    for(i=0;i<no_of_value_regs;i++)
    {
        value_arr_exp[i]=0;
    }
    //  Assign the starting address for integer pointers
    key_buf_exp = &key_arr_exp[0];
    mask_buf_exp = &mask_arr_exp[0];
    value_buf_exp = &value_arr_exp[0];

    TCAM_DEVICE * dev = (TCAM_DEVICE *)cx->base;
    if(cx != NULL && data != NULL && mask != NULL && value != NULL)
    {
        if(tcam_convert_hex_string_to_uint_array(data, key_buf_exp, no_of_key_regs) != 0)
            return TCAM_ERROR_KEY_FORMAT;
        if(tcam_convert_hex_string_to_uint_array(mask, mask_buf_exp, no_of_key_regs) != 0)
            return TCAM_ERROR_MASK_FORMAT;
        if(tcam_convert_hex_string_to_uint_array(value, value_buf_exp, no_of_value_regs) != 0)
            return TCAM_ERROR_VALUE_FORMAT; 
        //write key & mask registers  
        for(i=0;i<no_of_key_regs;i++)
        {
            cx->register_write((uint32_t)&dev->data[i],*key_buf_exp);
            key_buf_exp++;
            cx->register_write((uint32_t)&dev->mask[i],*mask_buf_exp);
            mask_buf_exp++;
        }       
        key_buf_exp = &key_arr_exp[0];
        mask_buf_exp = &mask_arr_exp[0];
        //write value registers
        for(i=0;i<no_of_value_regs;i++)
        {
            cx->register_write((uint32_t )&dev->value[i],*value_buf_exp);
            value_buf_exp++;
        }
        value_buf_exp = &value_arr_exp[0];
        //read request
        op_type = read;
        wr_data = ((op_type << TCAM_UPDATE_REQ_OP_OFFSET) & TCAM_UPDATE_REQ_OP_MASK) | ((addr << TCAM_UPDATE_REQ_ADDR_OFFSET) & TCAM_UPDATE_REQ_ADDR_MASK);
        cx->register_write((uint32_t)&dev->update_req,wr_data);
        //wait for update ACK
        tcam_wait_for_update_ack(cx);
        
        //Initialize arrays
        for(i=0;i<no_of_key_regs;i++)
        {
            key_arr_act[i]=0;
            mask_arr_act[i]=0;
        }
        for(i=0;i<no_of_value_regs;i++)
        {
            value_arr_act[i]=0;
        }
        //  Assign the starting address for integer pointers
        key_buf_act = &key_arr_act[0];
        mask_buf_act = &mask_arr_act[0];
        value_buf_act = &value_arr_act[0];
        
        //read key & mask registers  
        for(i=0;i<no_of_key_regs;i++)
        {
            *key_buf_act = cx->register_read((uint32_t)&dev->data[i]);
            key_buf_act++;
            *mask_buf_act = cx->register_read((uint32_t)&dev->mask[i]);
            mask_buf_act++;
        }
        //  Assign the starting address
        key_buf_act = &key_arr_act[0];
        mask_buf_act = &mask_arr_act[0];
        //read value registers
        for(i=0;i<no_of_value_regs;i++)
        {
            *value_buf_act = cx->register_read((uint32_t)&dev->value[i]);
            value_buf_act++;
        }
        //  Assign the starting address
        value_buf_act = &value_arr_act[0]; 
       
        //Compare input and result buffers
        for(i=0;i<no_of_key_regs;i++)
        {
            if((key_arr_exp[i] != key_arr_act[i]) || (mask_arr_exp[i] != mask_arr_act[i]))
            {
//                printf("expected_key_part_arr = %d,actual_key_part_arr = %d, part_index= %d\n",key_arr_exp[i],key_arr_act[i],i);
//                printf("expected_mask_part_arr = %d,actual_mask_part_arr = %d, part_index= %d\n",mask_arr_exp[i],mask_arr_act[i],i);
                return TCAM_ERROR_VERIFY_NO_MATCH;
            }
        }
        for(i=0;i<no_of_value_regs;i++)
        {
            if(value_arr_exp[i] != value_arr_act[i])
            {
//                printf("expected_value_part_arr = %d,actual_value_part_arr = %d, part_index= %d\n",value_arr_exp[i],value_arr_act[i],i);
                return TCAM_ERROR_VERIFY_NO_MATCH;
            }
        }
        return TCAM_SUCCESS;
    }
    else
    {
        if(cx == NULL)
            return TCAM_ERROR_NULL_CONTEXT_PTR;
        else if(data == NULL)
            return TCAM_ERROR_KEY_NULL;
        else if(mask == NULL)
            return TCAM_ERROR_MASK_NULL;
        else
            return TCAM_ERROR_VALUE_NULL;
    }
}

/*
Arguments   : error - A non-zero error code returned by the TCAM API function 
return      : char* - null-terminated string pointer containing a short description of the error code
Description : This function provides the runtime description of each error code
*/

const char* TCAM_Error_Decode( int error)
{
    switch(error)
    {
        case TCAM_SUCCESS :
            return "success";
        case TCAM_ERROR_INIT_SIZE :
            return "the size argument is not less than TCAM_ADDR_SIZE";
        case TCAM_ERROR_INIT_NULL_FUNCPTR :
            return "register_write, register_read or log_message function pointer is NULL";
        case TCAM_ERROR_INIT_READ_MISMATCH :
            return "register reads to TCAM instance did not return the expected data written via register writes";
        case TCAM_ERROR_INIT_LOG :
            return "log_message did not return the expected number of arguments on output of init messages";
        case TCAM_ERROR_NULL_CONTEXT_PTR :
            return "Context pointer is NULL";
        case TCAM_ERROR_INVALID_CONTEXT :
            return "Context magic number mismatch";
        case TCAM_ERROR_KEY_NULL :
            return "key string pointer is NULL";
        case TCAM_ERROR_MASK_NULL :
            return "mask string pointer is NULL";
        case TCAM_ERROR_VALUE_NULL :
            return "value string pointer is NULL";
        case TCAM_ERROR_KEY_FORMAT :
            return "invalid key string format";
        case TCAM_ERROR_MASK_FORMAT :
            return "invalid mask string format";
        case TCAM_ERROR_VALUE_FORMAT :
            return "invalid value string format";
        case TCAM_ERROR_VERIFY_NO_MATCH :
            return "Entry verification failed(did not match)";
        default :
            return "Miscellaneous device access error";
    }
}

/*
Arguments   : cx - A pointer to the TCAM_CONTEXT structure
return      : void
Description : This function waits for update ack to be set
*/
void tcam_wait_for_update_ack(TCAM_CONTEXT* cx)
{
    TCAM_DEVICE * dev = (TCAM_DEVICE *)cx->base;
    while(((cx->register_read((uint32_t)&dev->update_resp) & TCAM_UPDATE_ACK_MASK) >> TCAM_UPDATE_ACK_OFFSET) != 1)
    {
        ;
    }
}

/*
Arguments   : in_buf - A pointer to an array that can hold a null terminated C string representation of the
                       hexadecimal value
              out_buf - A pointer to an unsigned integer array 
              out_arr_size - size of the output array
return      : int - (An integer indicating success or an error code)
Description : This function converts the null terminated hex string to unsigned integer array
*/
int tcam_convert_hex_string_to_uint_array( const char *in_buf, uint32_t *out_buf, int out_arr_size)
{
    int i = 0;
    int len=0;
    int num_of_chars=0;
    uint32_t result = 0;
    uint32_t *start_addr;
    len=strlen(in_buf);
    //  Assign the starting address
    start_addr = out_buf;
    if((len*4) > (out_arr_size*32))
        return -1;
    else
    {
        //initialize output buffer
        for(i=0;i<out_arr_size;i++)
        {
            *out_buf = 0;
            out_buf++;
        }
        //  Assign the starting address
        out_buf = start_addr;
        for(i=len-1;i>=0;i--)
        {
            if(tcam_ChartoInt(in_buf[i]) != -1)
            {
                result = (result | (tcam_ChartoInt(in_buf[i]) << (4*num_of_chars)));
                num_of_chars++;
                if(num_of_chars == 8 || i == 0)
                {
                    num_of_chars = 0;
                    *out_buf = result;
                    out_buf++;
                    result = 0;
                }
            }
            else
                return -2;
        }
        //  Assign the starting address
        out_buf = start_addr;
        return 0;
    }
}

/*
Arguments   : c - A hexadecimal character input
return      : unsigned int - An unsigned integer value of input hexadecimal character
Description : This function converts the input hexadecimal character to its equivalent value 
*/
unsigned int tcam_ChartoInt(char c)
{
    if (c >= '0' && c <= '9') 
        return c - '0';
    else if (c >= 'A' && c <= 'F') 
        return 10 + c - 'A';
    else if (c >= 'a' && c <= 'f') 
        return 10 + c - 'a';
    else
        return -1;
}

/*
Arguments   : in_buf - A pointer to an unsigned integer array 
              out_buf - A pointer to an array that can hold a null terminated C string representation of the
                        hexadecimal value
              in_arr_size - size of the input array
return      : int - (An integer indicating success or an error code)
Description : This function converts the unsigned integer array to null terminated hex string
*/
/*
int tcam_convert_uint_array_to_hex_string( uint32_t *in_buf, char *out_buf, int in_arr_size)
{
    int i = 0;
    int j = 0;
    uint32_t *result;
    int len=0;
    char result_str[16] = "";
    char *result_buf;
    //  Assign the starting address
    result = in_buf;
    result_buf = &result_str[0];
    in_buf = in_buf + in_arr_size - 1;
    for (i = 0; i < in_arr_size; i++)
    {
        len = tcam_uint_to_str(*in_buf, result_buf, 16);
        in_buf--;
        for(j=0;j < 8-len;j++)
        {
            *out_buf = '0';
            out_buf++;
        }
        while(*result_buf)
        {
          *out_buf = *result_buf;
          result_buf++;
          out_buf++;
        }
        result_buf = &result_str[0];
    }
    *out_buf = '\0';

    //  Assign the starting address
    in_buf = result;
    return 0;
}
*/

/*
Arguments   : val - An unsigned integer value
              out_buf - A pointer to an array that can hold a string representation of the
                        hexadecimal value
return      : int - length of the hexadecimal string
Description : This function converts the input unsigned integer to its equivalent hexadecimal string
*/
/*
int tcam_uint_to_str(uint32_t val, char *out_buf, int radix)
{
    char tmp[16] = "";
    char *tp = tmp;
    int i;
    int len=0;
    while (val || tp == tmp)
    {
        i = val % radix;
        val /= radix;
        if (i < 10)
            *tp++ = i+'0';
        else
            *tp++ = i + 'a' - 10;
    }
    len = tp - tmp;
    while (tp > tmp)
        *out_buf++ = *--tp;

    return len;
}
*/



// XSIP watermark, do not delete 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
