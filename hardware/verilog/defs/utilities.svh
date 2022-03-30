`ifndef __UTILITES__
`define __UTILITES__


`define UNPACK_ARRAY_1D(PK_WIDTH, PK_LEN, PK_SRC, PK_DEST, g)                   \
    generate for(g = 0; g < (PK_LEN); g = g + 1) begin                          \
        always@(*) begin														\
            PK_DEST[g][PK_WIDTH - 1:0] = PK_SRC[(PK_WIDTH * g) +: PK_WIDTH];	\
        end                                                                     \
    end	endgenerate																



`define PACK_ARRAY_1D(PK_WIDTH, PK_LEN, PK_SRC, PK_DEST, g)                         \
    generate for(g = 0; g < (PK_LEN); g = g + 1) begin                              \
        always(*) begin																\
            PK_DEST[(PK_WIDTH * g) +: PK_WIDTH] = PK_SRC[g][PK_WIDTH - 1:0];     	\
        end																			\
    end endgenerate                                                                 



`endif