`ifndef __MATH__
`define __MATH__

//ceil of the log base 2

// function integer clog2;
//     input integer value;
//     begin
//         value = value-1;      
//         for(clog2 = 0; value > 0; clog2 = clog2 + 1)
//             value = value >> 1;
//     end
// endfunction


// function automatic integer floor;
// 	input integer divd;
// 	input integer divr;
// 	begin
// 		floor = divd / divr;
// 	end
// endfunction


function [31:0] floor(input [31:0] divd, divr);
	return divd / divr;
endfunction


// function [15:0] endian_swap16;
// 	input [15:0] value;
// 	begin
// 		endian_swap16 = {value[7:0],value[15:8]};
// 	end
// endfunction
// 
// 
// function [31:0] endian_swap32;
// 	input [31:0] value;
// 	begin
// 		endian_swap32 = {value[7:0],value[15:8],value[23:16],value[31:24]};
// 	end
// endfunction
// 
// function [63:0] endian_swap64;
// 	input [63:0] value;
// 	begin
// 		endian_swap64 = {value[7:0],value[15:8],value[23:16],value[31:24],value[39:32],value[47:40],value[55:48],value[63:56]};
// 	end
// endfunction
// 
// function [127:0] endian_swap128;
// 	input [127:0] value;
// 	begin
// 		endian_swap128 = {value[7:0],value[15:8],value[23:16],value[31:24],value[39:32],value[47:40],value[55:48],value[63:56],value[71:64],value[79:72],value[87:80],value[95:88],value[103:96],value[111:104],value[119:112],value[127:120]};
// 	end
// endfunction


`define max(a,b) {(a) > (b) ? (a) : (b)}
`define min(a,b) {(a) < (b) ? (a) : (b)}


`endif