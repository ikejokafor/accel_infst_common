`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:36:42 09/05/2008 
// Design Name: 
// Module Name:    arbitration_nway_single_cycle
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module arbitration_nway_single_cycle
(
	clk,
	rst,
	requests,
	grant_release,
	grant_valid,
	grant,
	grant_oh
);

`include "math.vh"

	parameter C_NUM_REQUESTORS 				= 8;
	localparam C_NUM_REQUESTORS_INT 		= 2**clog2(C_NUM_REQUESTORS);
	
	localparam C_LOG2_NUM_REQUESTORS 		= clog2(C_NUM_REQUESTORS);
	localparam C_LOG2_NUM_REQUESTORS_INT	= clog2(C_NUM_REQUESTORS_INT);
	
	input 									clk;
	input 									rst;
	input		[C_NUM_REQUESTORS-1:0]		requests;
	input 									grant_release;
	output  								grant_valid;
	output  	[C_LOG2_NUM_REQUESTORS-1:0] grant;
	output 		[C_NUM_REQUESTORS-1:0]		grant_oh;
	
	wire										arbitrate;
	wire		[C_NUM_REQUESTORS_INT-1:0]		requests_int;
	reg			[C_LOG2_NUM_REQUESTORS_INT-1:0]	grant_int;
	reg			[C_NUM_REQUESTORS_INT-1:0]		grant_oh_int;
	reg											grant_valid_int;
	reg			[C_LOG2_NUM_REQUESTORS_INT-1:0]	grant_int_index;
	integer										i;
	
	generate
		if (C_NUM_REQUESTORS_INT == C_NUM_REQUESTORS)
			assign requests_int = requests;
		else
			assign requests_int = {{(C_NUM_REQUESTORS_INT-C_NUM_REQUESTORS){1'b0}},requests};
	endgenerate
	
	assign arbitrate = (~grant_valid & |requests) | grant_release;
	
	
	always @(posedge clk)
	begin
		if (rst)
		begin
			grant_int		= {C_LOG2_NUM_REQUESTORS_INT{1'b0}};
			grant_int_index = 0;
			grant_valid_int	= 1'b0;
			grant_oh_int	= {C_NUM_REQUESTORS_INT{1'b0}};
		end
		else
		begin
			if (arbitrate)
			begin
				grant_valid_int	= 1'b0;
				grant_oh_int 	= {C_NUM_REQUESTORS_INT{1'b0}};
				
				for (i=0; i < C_NUM_REQUESTORS_INT; i=i+1)
				begin
					grant_int_index = grant_int+i;
					if (requests_int[$unsigned(grant_int_index)] & ~grant_release)
					begin
						grant_int 						= grant_int_index;
						grant_valid_int					= 1'b1;
						grant_oh_int 					= {C_NUM_REQUESTORS_INT{1'b0}};
						grant_oh_int[grant_int_index] 	= 1'b1;
					end
				end
			end
		end
	end
	
	assign grant_valid 	= grant_valid_int;
	assign grant_oh 	= grant_oh_int[C_NUM_REQUESTORS-1:0];
	assign grant 		= grant_int[C_LOG2_NUM_REQUESTORS-1:0];
endmodule
