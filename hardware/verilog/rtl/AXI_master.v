`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company:
//
// Engineer:
//
// Create Date:
// Design Name:
// Module Name:
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
//
//
// Revision:
//
//
//
//
// Additional Comments:
//
//
//
//
//
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module AXI_master #(

)(
    clk				        ,
    rst                     ,
    // AXI write address channel signals ------------------------------------------------------------------------------------------------------------
	axi_awready		        ,	// Indicates slave is ready to accept a 
	axi_awid		        ,	// Write ID
	axi_awaddr		        ,	// Write address
	axi_awlen		        ,	// Write Burst Length
	axi_awsize		        ,	// Write Burst size
	axi_awburst		        ,	// Write Burst type
	axi_awcache		        ,	// Write Cache type
	axi_awvalid		        ,	// Write address valid
	// AXI write data channel signals ---------------------------------------------------------------------------------------------------------------
	axi_wready		        ,	// Write data ready
	axi_wdata		        ,	// Write data
	axi_wstrb		        ,	// Write strobes
	axi_wlast		        ,	// Last write transaction   
	axi_wvalid		        ,	// Write valid  
	// AXI write response channel signals -----------------------------------------------------------------------------------------------------------
	axi_bid			        ,	// Response ID
	axi_bresp		        ,	// Write response
	axi_bvalid		        ,	// Write reponse valid
	axi_bready		        ,	// Response ready
	// AXI read address channel signals -------------------------------------------------------------------------------------------------------------
	axi_arready		        ,   // Read address ready
	axi_arid		        ,	// Read ID
	axi_araddr		        ,   // Read address
	axi_arlen		        ,   // Read Burst Length
	axi_arsize		        ,   // Read Burst size
	axi_arburst		        ,   // Read Burst type
	axi_arcache		        ,   // Read Cache type
	axi_arvalid		        ,   // Read address valid 
	// AXI read data channel signals ----------------------------------------------------------------------------------------------------------------   
	axi_rid			        ,   // Response ID
	axi_rresp		        ,   // Read response
	axi_rvalid		        ,   // Read reponse valid
	axi_rdata		        ,   // Read data
	axi_rlast		        ,   // Read last
	axi_rready		        ,   // Read Response ready
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    init_read_req           ,
    init_read_req_id        ,
    init_read_addr          ,
    init_read_len           ,
    init_read_req_ack       ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    init_read_data          ,
    init_read_data_vld      ,
    init_read_data_rdy      ,
    init_read_cmpl          ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    init_write_req          ,
    init_write_req_id       ,
    init_write_addr         ,
    init_write_len          ,
    init_write_req_ack      ,
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    init_write_cmpl         ,
    init_write_data         ,
    init_write_data_vld     ,
    init_write_data_rdy     
),
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Includes
    //-----------------------------------------------------------------------------------------------------------------------------------------------



    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Parameters
    //-----------------------------------------------------------------------------------------------------------------------------------------------

	
    
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Ports
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    input  logic        clk				;
    input  logic        rst             ;
    // AXI write address channel signals ------------------------------------------------------------------------------------------------------------
	input  logic  	    axi_awready		;	// Indicates slave is ready to accept a 
	output logic[3:0]  	axi_awid		;	// Write ID
	output logic[28:0] 	axi_awaddr		;	// Write address
	output logic[7:0]  	axi_awlen		;	// Write Burst Length
	output logic[2:0]  	axi_awsize		;	// Write Burst size
	output logic[1:0]  	axi_awburst		;	// Write Burst type
	output logic[3:0]  	axi_awcache		;	// Write Cache type
	output logic  	    axi_awvalid		;	// Write address valid
	// AXI write data channel signals ---------------------------------------------------------------------------------------------------------------
	input  logic  	    axi_wready		;	// Write data ready
	output logic[63:0] 	axi_wdata		;	// Write data
	output logic[7:0]  	axi_wstrb		;	// Write strobes
	output logic  	    axi_wlast		;	// Last write transaction   
	output logic  	    axi_wvalid		;	// Write valid  
	// AXI write response channel signals -----------------------------------------------------------------------------------------------------------
	input  logic[3:0]  	axi_bid			;	// Response ID
	input  logic[1:0]  	axi_bresp		;	// Write response
	input  logic  	    axi_bvalid		;	// Write reponse valid
	output logic  	    axi_bready		;	// Response ready
	// AXI read address channel signals -------------------------------------------------------------------------------------------------------------
	input  logic  	    axi_arready		;   // Read address ready
	output logic[3:0]   axi_arid		;	// Read ID
	output logic[28:0]  axi_araddr		;   // Read address
	output logic[7:0]   axi_arlen		;   // Read Burst Length
	output logic[2:0]   axi_arsize		;   // Read Burst size
	output logic[1:0]   axi_arburst		;   // Read Burst type
	output logic[3:0]   axi_arcache		;   // Read Cache type
	output logic  	    axi_arvalid		;   // Read address valid 
	// AXI read data channel signals ----------------------------------------------------------------------------------------------------------------   
	input  logic[3:0]   axi_rid			;   // Response ID
	input  logic[1:0]   axi_rresp		;   // Read response
	input  logic        axi_rvalid		;   // Read reponse valid
	input  logic[63:0]  axi_rdata		;   // Read data
	input  logic        axi_rlast		;   // Read last
	output logic        axi_rready		;   // Read Response ready
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    output logic [            `MAX_FAS_RD_ID - 1:0]   init_read_req              							    ;
    output logic [         C_INIT_REQ_ID_WTH - 1:0]   init_read_req_id           							    ;
    output logic [    C_INIT_MEM_RD_ADDR_WTH - 1:0]   init_read_addr             							    ;
    output logic [     C_INIT_MEM_RD_LEN_WTH - 1:0]   init_read_len              							    ;
    input  logic [            `MAX_FAS_RD_ID - 1:0]   init_read_req_ack          							    ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------  
    input  logic [       `INIT_RD_DATA_WIDTH - 1:0]   init_read_data             							    ;
    input  logic [            `MAX_FAS_RD_ID - 1:0]   init_read_data_vld         							    ;
    output logic [            `MAX_FAS_RD_ID - 1:0]   init_read_data_rdy         							    ;
    input  logic [            `MAX_FAS_RD_ID - 1:0]   init_read_cmpl             							    ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    output logic                                      init_write_req             							    ;
    output logic                                      init_write_req_id          							    ;
    output logic [       `INIT_WR_ADDR_WIDTH - 1:0]   init_write_addr            							    ;
    output logic [        `INIT_WR_LEN_WIDTH - 1:0]   init_write_len             							    ;
    input  logic                                      init_write_req_ack         							    ;
    // BEGIN ----------------------------------------------------------------------------------------------------------------------------------------
    output logic [       `INIT_RD_DATA_WIDTH - 1:0]   init_write_data            							    ;
    output logic                                      init_write_data_vld        							    ;
    input  logic                                      init_write_data_rdy        							    ;
    input  logic                                      init_write_cmpl            							    ;

    
endmodule