#ifndef TCAM_H
#define TCAM_H

typedef unsigned int uint32_t;

/************************** Constant Definitions *****************************/
#define TCAM_MAX_KEY_WIDTH      512 
#define TCAM_MAX_VALUE_WIDTH    256 
#define TCAM_NO_OF_KEY_REGS     (TCAM_MAX_KEY_WIDTH/32) 
#define TCAM_NO_OF_VALUE_REGS   (TCAM_MAX_VALUE_WIDTH/32)    
#define TCAM_ADDR_SIZE     256

enum Operation
{
read,
write,
init
}op_type;

enum Write
{
erase,
insert
}wr_type;

#define TCAM_UPDATE_REQ_OP_MASK          0x30000000
#define TCAM_UPDATE_REQ_OP_OFFSET        28
#define TCAM_UPDATE_REQ_ADDR_MASK        0x0000FFFF
#define TCAM_UPDATE_REQ_ADDR_OFFSET      0
#define TCAM_UPDATE_ACK_MASK             0x00000001
#define TCAM_UPDATE_ACK_OFFSET           0
#define TCAM_UPDATE_VALID_MASK           0x00000001
#define TCAM_UPDATE_VALID_OFFSET         0
/**
* Error Codes
*/

//success
#define TCAM_SUCCESS                    0 
//the size argument is not less than TCAM_ADDR_SIZE
#define TCAM_ERROR_INIT_SIZE            1 
//register_write, register_read, or log_message function pointer is NULL
#define TCAM_ERROR_INIT_NULL_FUNCPTR    2
//register reads to TCAM instance did not return the expected data written via register writes
#define TCAM_ERROR_INIT_READ_MISMATCH   3
//log_message did not return the expected number of arguments on output of init messages
#define TCAM_ERROR_INIT_LOG             4
//Context pointer is NULL
#define TCAM_ERROR_NULL_CONTEXT_PTR     5
//Context magic number mismatch
#define TCAM_ERROR_INVALID_CONTEXT      6
//key string pointer is NULL
#define TCAM_ERROR_KEY_NULL             7   
//mask string pointer is NULL
#define TCAM_ERROR_MASK_NULL            8  
//value string pointer is NULL
#define TCAM_ERROR_VALUE_NULL           9 
//invalid key string format
#define TCAM_ERROR_KEY_FORMAT           10
//invalid mask string format
#define TCAM_ERROR_MASK_FORMAT          11
//invalid value string format
#define TCAM_ERROR_VALUE_FORMAT         12 
//Entry verification failed (did not match)
#define TCAM_ERROR_VERIFY_NO_MATCH      13 
//Miscellaneous device access error
#define TCAM_ERROR_ACC                  14


typedef struct TCAM_DEVICE{
//device_id @ offset 0x00
uint32_t device_id;
//reserved0 @ offset 0x04 to 0x3C
uint32_t reserved0[15];
//update_req @ offset 0x40
uint32_t update_req;
//update_resp @ offset 0x44
uint32_t update_resp;
//reserved1 @ offset 0x48
uint32_t reserved1;
//valid_reg @ offset 0x4C
uint32_t valid;
//data @ offset 0x50 to 0x8F
uint32_t data[TCAM_NO_OF_KEY_REGS];
//mask @ offset 0x90 to 0xCF
uint32_t mask[TCAM_NO_OF_KEY_REGS];
//value @ offset 0xD0 to 0xEF
uint32_t value[TCAM_NO_OF_VALUE_REGS];
//reserved2 @ offset 0xF0 to 0xFF
uint32_t reserved2[4];
}TCAM_DEVICE;


typedef struct TCAM_CONTEXT{
uint32_t max_depth;
uint32_t key_width;
uint32_t value_width;
uint32_t num_ranges;
uint32_t range_width;
uint32_t range_offset;
uint32_t base;
void(*register_write)(uint32_t addr, uint32_t data);
uint32_t(*register_read)(uint32_t addr);
int(*log_message)(const char * format);
uint32_t log_level;
}TCAM_CONTEXT;

/************************** Function Prototypes ******************************/

uint32_t TCAM_Init_GetAddrSize();

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
uint32_t(*register_read)(uint32_t addr),
int(*log_message)(const char * format),
uint32_t log_level
);

int TCAM_Init_SetLogLevel(TCAM_CONTEXT* cx, uint32_t log_level);

int TCAM_Init_Activate(TCAM_CONTEXT* cx);

int TCAM_Mgt_WriteEntry(TCAM_CONTEXT* cx, uint32_t addr, const char* data, const char* mask, const char* value);

int TCAM_Mgt_EraseEntry (TCAM_CONTEXT* cx, uint32_t addr);

int TCAM_Mgt_VerifyEntry(TCAM_CONTEXT* cx, uint32_t addr, const char* data, const char* mask, const char* value);

const char* TCAM_Error_Decode( int error);


#endif 

// XSIP watermark, do not delete 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
