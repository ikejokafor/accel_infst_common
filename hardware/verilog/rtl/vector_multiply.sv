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
module vector_multiply 
#(
	parameter C_OP_WIDTH = 16,
	parameter C_NUM_OPERANDS = 2
) (
    clk     			        ,
    rst                         ,
    datain	             		,
	datain_ready				,
    datain_valid				,
	dout						,
	dout_ready					,
	dout_valid
);
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Parameters
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	localparam C_DATAIN_WIDTH 	    = C_OP_WIDTH * C_NUM_OPERANDS;	
	localparam C_OP_VEC_WIDTH		= C_OP_WIDTH * (C_NUM_OPERANDS / 2);
	localparam C_DOUT_WIDTH			= C_OP_VEC_WIDTH;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Module Ports
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    input 	logic 							clk     		;
    input 	logic 							rst             ;
    input 	logic [C_DATAIN_WIDTH - 1:0]	datain          ;    
    output	logic 							datain_ready	;    
	input 	logic 							datain_valid	;
	output	logic [C_DOUT_WIDTH - 1:0] 	    dout			;
	input	logic 							dout_ready		;
	output 	logic 							dout_valid		;


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Variables
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	logic [C_OP_VEC_WIDTH - 1:0] operand0	;
	logic [C_OP_VEC_WIDTH - 1:0] operand1	;
	integer	     				 i		 	;
	
	
	// BEGIN logic ----------------------------------------------------------------------------------------------------------------------------------
	assign operand0 = datain[C_OP_VEC_WIDTH - 1:0];
	assign operand1 = datain[((C_OP_VEC_WIDTH * 2) - 1):C_OP_VEC_WIDTH];
	
	always@(posedge clk) begin
		dout_valid <= 0;
		if(datain_valid && dout_ready) begin
			for(i = 0; i < C_NUM_OPERANDS; i = i + 1) begin
				dout[i] <= operand0[i] * operand1[i];
			end
			dout_valid 	<= 1;
		end
	end
    // END logic ------------------------------------------------------------------------------------------------------------------------------------


    // DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
    // DEBUG ----------------------------------------------------------------------------------------------------------------------------------------
endmodule
