`ifndef __MATH__
`define __MATH__

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

`define max(a,b) {(a) > (b) ? (a) : (b)}
`define min(a,b) {(a) < (b) ? (a) : (b)}

`endif