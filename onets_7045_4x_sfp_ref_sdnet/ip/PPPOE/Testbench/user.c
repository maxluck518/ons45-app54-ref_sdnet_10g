#include <stdint.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

# include "TCAM.h"

# include "svdpi.h"
# include "dpi.h"

// ******************************************************

// global context vars
TCAM_CONTEXT TCAM_CONTEXT_qinq_tb_context;
TCAM_CONTEXT TCAM_CONTEXT_domain_tb_context;
TCAM_CONTEXT TCAM_CONTEXT_l3_tb_context;
TCAM_CONTEXT TCAM_CONTEXT_pppL2_tb_context;
TCAM_CONTEXT TCAM_CONTEXT_extL2_tb_context;
uint32_t log_level=0;

// enumeration
  #define TABLE_qinq_tb 0
 #define TABLE_domain_tb 1
 #define TABLE_l3_tb 2
 #define TABLE_pppL2_tb 3
 #define TABLE_extL2_tb 4

// user-level wrapper functions for SV
// NOTE: needed to provide an function pointer for context
// NOTE: and link to SV function by name

// register write control_qinq_tb
void            
register_write_control_qinq_tb(uint32_t Addr, uint32_t Data) {
//   printf("[SW] register_write_control_qinq_tb(%08x, %08x) - start\n", Addr, Data);
    s_vpi_vecval sv_addr;
    sv_addr.aval = Addr;
    sv_addr.bval = 0;
    
    s_vpi_vecval sv_data;
    sv_data.aval = Data;
    sv_data.bval = 0;
    
    SV_write_control_qinq_tb(&sv_addr, &sv_data);
//    printf("[SW] register_write_control_qinq_tb(%08x, %08x) - done\n", Addr, Data);
}

// register read control_qinq_tb
uint32_t       
register_read_control_qinq_tb(uint32_t Addr) {
//    printf("[SW] register_read_control_qinq_tb(%08x) - start\n", Addr);
    s_vpi_vecval sv_addr;
    sv_addr.aval = Addr;
    sv_addr.bval = 0;
    
    s_vpi_vecval sv_data;
    
    SV_read_control_qinq_tb(&sv_addr, &sv_data);
//    printf("[SW] register_read_control_qinq_tb(%08x) = %08x - done\n", Addr, sv_data.aval);
    
    return sv_data.aval;
}

// user-level wrapper functions for SV
// NOTE: needed to provide an function pointer for context
// NOTE: and link to SV function by name

// register write control_domain_tb
void            
register_write_control_domain_tb(uint32_t Addr, uint32_t Data) {
//   printf("[SW] register_write_control_domain_tb(%08x, %08x) - start\n", Addr, Data);
    s_vpi_vecval sv_addr;
    sv_addr.aval = Addr;
    sv_addr.bval = 0;
    
    s_vpi_vecval sv_data;
    sv_data.aval = Data;
    sv_data.bval = 0;
    
    SV_write_control_domain_tb(&sv_addr, &sv_data);
//    printf("[SW] register_write_control_domain_tb(%08x, %08x) - done\n", Addr, Data);
}

// register read control_domain_tb
uint32_t       
register_read_control_domain_tb(uint32_t Addr) {
//    printf("[SW] register_read_control_domain_tb(%08x) - start\n", Addr);
    s_vpi_vecval sv_addr;
    sv_addr.aval = Addr;
    sv_addr.bval = 0;
    
    s_vpi_vecval sv_data;
    
    SV_read_control_domain_tb(&sv_addr, &sv_data);
//    printf("[SW] register_read_control_domain_tb(%08x) = %08x - done\n", Addr, sv_data.aval);
    
    return sv_data.aval;
}

// user-level wrapper functions for SV
// NOTE: needed to provide an function pointer for context
// NOTE: and link to SV function by name

// register write control_l3_tb
void            
register_write_control_l3_tb(uint32_t Addr, uint32_t Data) {
//   printf("[SW] register_write_control_l3_tb(%08x, %08x) - start\n", Addr, Data);
    s_vpi_vecval sv_addr;
    sv_addr.aval = Addr;
    sv_addr.bval = 0;
    
    s_vpi_vecval sv_data;
    sv_data.aval = Data;
    sv_data.bval = 0;
    
    SV_write_control_l3_tb(&sv_addr, &sv_data);
//    printf("[SW] register_write_control_l3_tb(%08x, %08x) - done\n", Addr, Data);
}

// register read control_l3_tb
uint32_t       
register_read_control_l3_tb(uint32_t Addr) {
//    printf("[SW] register_read_control_l3_tb(%08x) - start\n", Addr);
    s_vpi_vecval sv_addr;
    sv_addr.aval = Addr;
    sv_addr.bval = 0;
    
    s_vpi_vecval sv_data;
    
    SV_read_control_l3_tb(&sv_addr, &sv_data);
//    printf("[SW] register_read_control_l3_tb(%08x) = %08x - done\n", Addr, sv_data.aval);
    
    return sv_data.aval;
}

// user-level wrapper functions for SV
// NOTE: needed to provide an function pointer for context
// NOTE: and link to SV function by name

// register write control_pppL2_tb
void            
register_write_control_pppL2_tb(uint32_t Addr, uint32_t Data) {
//   printf("[SW] register_write_control_pppL2_tb(%08x, %08x) - start\n", Addr, Data);
    s_vpi_vecval sv_addr;
    sv_addr.aval = Addr;
    sv_addr.bval = 0;
    
    s_vpi_vecval sv_data;
    sv_data.aval = Data;
    sv_data.bval = 0;
    
    SV_write_control_pppL2_tb(&sv_addr, &sv_data);
//    printf("[SW] register_write_control_pppL2_tb(%08x, %08x) - done\n", Addr, Data);
}

// register read control_pppL2_tb
uint32_t       
register_read_control_pppL2_tb(uint32_t Addr) {
//    printf("[SW] register_read_control_pppL2_tb(%08x) - start\n", Addr);
    s_vpi_vecval sv_addr;
    sv_addr.aval = Addr;
    sv_addr.bval = 0;
    
    s_vpi_vecval sv_data;
    
    SV_read_control_pppL2_tb(&sv_addr, &sv_data);
//    printf("[SW] register_read_control_pppL2_tb(%08x) = %08x - done\n", Addr, sv_data.aval);
    
    return sv_data.aval;
}

// user-level wrapper functions for SV
// NOTE: needed to provide an function pointer for context
// NOTE: and link to SV function by name

// register write control_extL2_tb
void            
register_write_control_extL2_tb(uint32_t Addr, uint32_t Data) {
//   printf("[SW] register_write_control_extL2_tb(%08x, %08x) - start\n", Addr, Data);
    s_vpi_vecval sv_addr;
    sv_addr.aval = Addr;
    sv_addr.bval = 0;
    
    s_vpi_vecval sv_data;
    sv_data.aval = Data;
    sv_data.bval = 0;
    
    SV_write_control_extL2_tb(&sv_addr, &sv_data);
//    printf("[SW] register_write_control_extL2_tb(%08x, %08x) - done\n", Addr, Data);
}

// register read control_extL2_tb
uint32_t       
register_read_control_extL2_tb(uint32_t Addr) {
//    printf("[SW] register_read_control_extL2_tb(%08x) - start\n", Addr);
    s_vpi_vecval sv_addr;
    sv_addr.aval = Addr;
    sv_addr.bval = 0;
    
    s_vpi_vecval sv_data;
    
    SV_read_control_extL2_tb(&sv_addr, &sv_data);
//    printf("[SW] register_read_control_extL2_tb(%08x) = %08x - done\n", Addr, sv_data.aval);
    
    return sv_data.aval;
}

//log message
int log_msg(const char * msg)
{
	printf(msg);
	return 0;
}

void 
TCAM_Init(int tableID, int k, int v, int depth, int n_range, int range_size, int range_offset) {
    printf("[SW] TCAM_Init() - start\n");
	TCAM_CONTEXT * cx; 
	void( * register_write)(uint32_t addr, uint32_t data); 
	uint32_t( * register_read)(uint32_t addr);
	int baseAddr = 0;
	switch (tableID) {
	case 0:
		cx = &TCAM_CONTEXT_qinq_tb_context;
		register_read  = &register_read_control_qinq_tb;
		register_write = &register_write_control_qinq_tb;
		break;
	case 1:
		cx = &TCAM_CONTEXT_domain_tb_context;
		register_read  = &register_read_control_domain_tb;
		register_write = &register_write_control_domain_tb;
		break;
	case 2:
		cx = &TCAM_CONTEXT_l3_tb_context;
		register_read  = &register_read_control_l3_tb;
		register_write = &register_write_control_l3_tb;
		break;
	case 3:
		cx = &TCAM_CONTEXT_pppL2_tb_context;
		register_read  = &register_read_control_pppL2_tb;
		register_write = &register_write_control_pppL2_tb;
		break;
	case 4:
		cx = &TCAM_CONTEXT_extL2_tb_context;
		register_read  = &register_read_control_extL2_tb;
		register_write = &register_write_control_extL2_tb;
		break;
	}

    if(TCAM_Init_ValidateContext(cx,baseAddr,256,depth,k,v,n_range,range_size,range_offset, register_write, register_read, &log_msg, log_level))    
    {
    	printf("[SW] TCAM_Init() - failed\n");
    }
    else
    {
    	printf("[SW] TCAM_Init() - done\n");
    }
}
int
TCAM_Clean(int tableID) {
	TCAM_CONTEXT * cx; 
	switch (tableID) {
	case 0:
		cx = &TCAM_CONTEXT_qinq_tb_context;
		break;
	case 1:
		cx = &TCAM_CONTEXT_domain_tb_context;
		break;
	case 2:
		cx = &TCAM_CONTEXT_l3_tb_context;
		break;
	case 3:
		cx = &TCAM_CONTEXT_pppL2_tb_context;
		break;
	case 4:
		cx = &TCAM_CONTEXT_extL2_tb_context;
		break;
	}

    int error_code=0;
    printf("[SW] TCAM_Init_Activate() - start\n");
    error_code = TCAM_Init_Activate(cx);
    printf("[SW] TCAM_Init_Activate() - done\n");
    return error_code;
}

int
TCAM_GetAddrSize() {
    int addr_size;
    printf("[SW] TCAM_GetAddrSize() - start\n");
    addr_size = TCAM_Init_GetAddrSize();
    printf("[SW] TCAM_GetAddrSize() - done\n");

    return addr_size;
}

int
TCAM_SetLogLevel(int tableID, int msg_level) {
	TCAM_CONTEXT * cx; 
	switch (tableID) {
	case 0:
		cx = &TCAM_CONTEXT_qinq_tb_context;
		break;
	case 1:
		cx = &TCAM_CONTEXT_domain_tb_context;
		break;
	case 2:
		cx = &TCAM_CONTEXT_l3_tb_context;
		break;
	case 3:
		cx = &TCAM_CONTEXT_pppL2_tb_context;
		break;
	case 4:
		cx = &TCAM_CONTEXT_extL2_tb_context;
		break;
	}

    int error_code=0;
    printf("[SW] TCAM_SetLogLevel() - start\n");
    error_code = TCAM_Init_SetLogLevel(cx,msg_level);
    printf("[SW] TCAM_SetLogLevel() - done\n");
    return error_code;
}

int
TCAM_WriteEntry(int tableID, int addr, const char* data, const char* mask, const char* value) {
	TCAM_CONTEXT * cx; 
	switch (tableID) {
	case 0:
		cx = &TCAM_CONTEXT_qinq_tb_context;
		break;
	case 1:
		cx = &TCAM_CONTEXT_domain_tb_context;
		break;
	case 2:
		cx = &TCAM_CONTEXT_l3_tb_context;
		break;
	case 3:
		cx = &TCAM_CONTEXT_pppL2_tb_context;
		break;
	case 4:
		cx = &TCAM_CONTEXT_extL2_tb_context;
		break;
	}

    uint32_t address = (uint32_t)addr;
    int error_code=0;
    printf("[SW] TCAM_WriteEntry() - start\n");
    error_code = TCAM_Mgt_WriteEntry(cx, address, data, mask, value);
    printf("[SW] TCAM_WriteEntry() - done\n");
    return error_code;
}

int
TCAM_EraseEntry (int tableID, int addr) {
	TCAM_CONTEXT * cx; 
	switch (tableID) {
	case 0:
		cx = &TCAM_CONTEXT_qinq_tb_context;
		break;
	case 1:
		cx = &TCAM_CONTEXT_domain_tb_context;
		break;
	case 2:
		cx = &TCAM_CONTEXT_l3_tb_context;
		break;
	case 3:
		cx = &TCAM_CONTEXT_pppL2_tb_context;
		break;
	case 4:
		cx = &TCAM_CONTEXT_extL2_tb_context;
		break;
	}

    int error_code=0;
    printf("[SW] TCAM_EraseEntry() - start\n");
    error_code = TCAM_Mgt_EraseEntry(cx, (uint32_t)addr);
    printf("[SW] TCAM_EraseEntry() - done\n");
    return error_code;
}

int
TCAM_VerifyEntry(int tableID, int addr, const char* data, const char* mask, const char* value, int* error_code) {
	TCAM_CONTEXT * cx; 
	switch (tableID) {
	case 0:
		cx = &TCAM_CONTEXT_qinq_tb_context;
		break;
	case 1:
		cx = &TCAM_CONTEXT_domain_tb_context;
		break;
	case 2:
		cx = &TCAM_CONTEXT_l3_tb_context;
		break;
	case 3:
		cx = &TCAM_CONTEXT_pppL2_tb_context;
		break;
	case 4:
		cx = &TCAM_CONTEXT_extL2_tb_context;
		break;
	}

    uint32_t address = (uint32_t)addr;
    printf("[SW] TCAM_VerifyEntry() - start\n");
    *error_code = TCAM_Mgt_VerifyEntry(cx, address, data, mask, value);
    printf("[SW] TCAM_VerifyEntry() - done\n");
    return 0;
}

const char* TCAM_Error_Description(int error)
{
    const char* error_desc;
    printf("[SW] TCAM_Error_Decode() - start\n");
    error_desc = TCAM_Error_Decode(error);
    printf("[SW] TCAM_Error_Decode() - done\n");
    return error_desc;
}

