//-----------------------------------------------------------------//
//user_data_path.v
//
//-----------------------------------------------------------------//
module user_data_path_mon(
      input          	clk,                       //system clk
      input          	reset,                     //system reset

      input [255:0]   	s_axis_tdata_0,
	  input [31:0]    	s_axis_tstrb_0,
      input          	s_axis_tvalid_0,
      input          	s_axis_tlast_0,
      input [127:0]    	s_axis_tuser_0,
      output         	s_axis_tready_0,

      input [255:0]   	s_axis_tdata_1,
      input [31:0]    	s_axis_tstrb_1,
      input          	s_axis_tvalid_1,
      input          	s_axis_tlast_1,
      input [127:0]    	s_axis_tuser_1,
      output         	s_axis_tready_1,

      output [255:0]  	m_axis_tdata_0,
      output [31:0]   	m_axis_tstrb_0,
      output         	m_axis_tvalid_0,
      output         	m_axis_tlast_0,
      output [127:0]   	m_axis_tuser_0,
      input          	m_axis_tready_0

    );
   
   
   
   ////////////////////////////////////   
   // udp : arbiter src_port: 01 04 10 40 
   ////////////////////////////////////
   input_arbiter
     #(.C_M_AXIS_DATA_WIDTH(256),
       .C_S_AXIS_DATA_WIDTH(256),
	   .C_M_AXIS_TUSER_WIDTH(128),
	   .C_S_AXIS_TUSER_WIDTH(128),
	   .NUM_QUEUES(4)
		)
   osnt_input_arbiter
     ( 
	 .m_axis_tdata        (m_axis_tdata_0), 
	 .m_axis_tstrb        (m_axis_tstrb_0),
	 .m_axis_tuser        (m_axis_tuser_0), 	  
     .m_axis_tvalid       (m_axis_tvalid_0), 
     .m_axis_tlast        (m_axis_tlast_0), 
     .m_axis_tready       (m_axis_tready_0), 

      // --- Interface to the input queues
    .s_axis_tdata_0        (s_axis_tdata_0), 
	.s_axis_tstrb_0        (s_axis_tstrb_0),
	.s_axis_tuser_0        (s_axis_tuser_0), 	  
    .s_axis_tvalid_0       (s_axis_tvalid_0), 
    .s_axis_tlast_0        (s_axis_tlast_0), 
    .s_axis_tready_0       (s_axis_tready_0), 

	.s_axis_tdata_1        (s_axis_tdata_1), 
	.s_axis_tstrb_1        (s_axis_tstrb_1),
	.s_axis_tuser_1        (s_axis_tuser_1), 	  
    .s_axis_tvalid_1       (s_axis_tvalid_1), 
    .s_axis_tlast_1        (s_axis_tlast_1), 
    .s_axis_tready_1       (s_axis_tready_1),

	
	
      // --- Misc
    .axi_resetn                (~reset),
    .axi_aclk                  (clk)
    );

endmodule
