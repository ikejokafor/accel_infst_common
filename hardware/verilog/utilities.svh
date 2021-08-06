`ifndef __UTILITES__
`define __UTILITES__

`define BITS_PER_BYTE 2

//ceil of the log base 2
function integer clog2;
    input integer value;
    begin
        value = value-1;      
        for(clog2 = 0; value > 0; clog2 = clog2 + 1)
            value = value >> 1;
    end
endfunction


function [15:0] endian_swap16;
	input [15:0] value;
	begin
		endian_swap16 = {value[7:0],value[15:8]};
	end
endfunction


function integer floor;
	input integer divd;
	input integer divr;
	begin
		floor = divd / divr;
	end
endfunction


`define max(a, b) {(a) > (b) ? (a) : (b)}
`define min(a, b) {(a) < (b) ? (a) : (b)}


`define UNPACK_ARRAY_1D(PK_WIDTH, PK_LEN, PK_SRC, PK_DEST, g)                       \
    generate                                                                        \
		for(g = 0; g < (PK_LEN); g = g + 1) begin									\
			always@(*) begin														\
				PK_DEST[g][PK_WIDTH - 1:0] = PK_SRC[(PK_WIDTH * g) +: PK_WIDTH];	\
			end                                                                     \
		end																			\
    endgenerate                                                                     \


`define PACK_ARRAY_1D(PK_WIDTH, PK_LEN, PK_SRC, PK_DEST, g)                             \
    generate                                                                            \
        for(g = 0; g < (PK_LEN); g = g + 1) begin                                       \
			always(*) begin																\
				PK_DEST[(PK_WIDTH * g) +: PK_WIDTH] = PK_SRC[g][PK_WIDTH - 1:0];     	\
			end																			\
        end                                                                             \
    endgenerate                                                                         \


`endif