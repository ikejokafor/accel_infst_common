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
module xilinx_bram #(
    parameter C_RAM_WR_WIDTH        = 16    ,
    parameter C_RAM_WR_DEPTH        = 1024  ,
    parameter C_RAM_RD_WIDTH        = 32    ,
    parameter C_RAM_RD_DEPTH        = 1024  ,
    parameter C_RD_PORT_HIGH_PERF   = "HIGH_PERFORMANCE"
) (

      .DOA(DOA),       // Output port-A data, width defined by READ_WIDTH_A parameter
      .DOB(DOB),       // Output port-B data, width defined by READ_WIDTH_B parameter
      .ADDRA(ADDRA),   // Input port-A address, width defined by Port A depth
      .ADDRB(ADDRB),   // Input port-B address, width defined by Port B depth
      .CLKA(CLKA),     // 1-bit input port-A clock
      .CLKB(CLKB),     // 1-bit input port-B clock
      .DIA(DIA),       // Input port-A data, width defined by WRITE_WIDTH_A parameter
      .DIB(DIB),       // Input port-B data, width defined by WRITE_WIDTH_B parameter
      .ENA(ENA),       // 1-bit input port-A enable
      .ENB(ENB),       // 1-bit input port-B enable
      .REGCEA(REGCEA), // 1-bit input port-A output register enable
      .REGCEB(REGCEB), // 1-bit input port-B output register enable
      .RSTA(RSTA),     // 1-bit input port-A reset
      .RSTB(RSTB),     // 1-bit input port-B reset
      .WEA(WEA),       // Input port-A write enable, width defined by Port A depth
      .WEB(WEB)        // Input port-B write enable, width defined by Port B depth
)

    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Includes
    //-----------------------------------------------------------------------------------------------------------------------------------------------
    `include "math.svh"


    //-----------------------------------------------------------------------------------------------------------------------------------------------
    //  Local Parameters
    //-----------------------------------------------------------------------------------------------------------------------------------------------
	
	

	//-----------------------------------------------------------------------------------------------------------------------------------------------
	//  Module Ports
	//-----------------------------------------------------------------------------------------------------------------------------------------------
	
	genvar i,j;
	generate
		if(C_RAM_RD_WIDTH > C_RAM_WR_WIDTH) begin
			for(i = 0; i < C_RAM_WR_DEPTH; i = i + 1)
			// BRAM_TDP_MACRO: True Dual Port RAM
			//                 Virtex-7
			// Xilinx HDL Language Template, version 2018.3

			//////////////////////////////////////////////////////////////////////////
			// DATA_WIDTH_A/B | BRAM_SIZE | RAM Depth | ADDRA/B Width | WEA/B Width //
			// ===============|===========|===========|===============|=============//
			//     19-36      |  "36Kb"   |    1024   |    10-bit     |    4-bit    //
			//     10-18      |  "36Kb"   |    2048   |    11-bit     |    2-bit    //
			//     10-18      |  "18Kb"   |    1024   |    10-bit     |    2-bit    //
			//      5-9       |  "36Kb"   |    4096   |    12-bit     |    1-bit    //
			//      5-9       |  "18Kb"   |    2048   |    11-bit     |    1-bit    //
			//      3-4       |  "36Kb"   |    8192   |    13-bit     |    1-bit    //
			//      3-4       |  "18Kb"   |    4096   |    12-bit     |    1-bit    //
			//        2       |  "36Kb"   |   16384   |    14-bit     |    1-bit    //
			//        2       |  "18Kb"   |    8192   |    13-bit     |    1-bit    //
			//        1       |  "36Kb"   |   32768   |    15-bit     |    1-bit    //
			//        1       |  "18Kb"   |   16384   |    14-bit     |    1-bit    //
			//////////////////////////////////////////////////////////////////////////
			BRAM_TDP_MACRO #(
				.BRAM_SIZE("36Kb"), // Target BRAM: "18Kb" or "36Kb" 
				.DEVICE("7SERIES"), // Target device: "7SERIES" 
				.DOA_REG(0),        // Optional port A output register (0 or 1)
				.DOB_REG(0),        // Optional port B output register (0 or 1)
				.INIT_A(36'h0000000),  // Initial values on port A output port
				.INIT_B(36'h00000000), // Initial values on port B output port
				.INIT_FILE ("NONE"),
				.READ_WIDTH_A (0),   // Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
				.READ_WIDTH_B (0),   // Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
				.SIM_COLLISION_CHECK ("ALL"), // Collision check enable "ALL", "WARNING_ONLY",
											//   "GENERATE_X_ONLY" or "NONE" 
				.SRVAL_A(36'h00000000), // Set/Reset value for port A output
				.SRVAL_B(36'h00000000), // Set/Reset value for port B output
				.WRITE_MODE_A("WRITE_FIRST"), // "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE" 
				.WRITE_MODE_B("WRITE_FIRST"), // "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE" 
				.WRITE_WIDTH_A(0), // Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
				.WRITE_WIDTH_B(0) // Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
			) 
			BRAM_TDP_MACRO_inst (
				.DOA(DOA),       // Output port-A data, width defined by READ_WIDTH_A parameter
				.DOB(DOB),       // Output port-B data, width defined by READ_WIDTH_B parameter
				.ADDRA(ADDRA),   // Input port-A address, width defined by Port A depth
				.ADDRB(ADDRB),   // Input port-B address, width defined by Port B depth
				.CLKA(CLKA),     // 1-bit input port-A clock
				.CLKB(CLKB),     // 1-bit input port-B clock
				.DIA(DIA),       // Input port-A data, width defined by WRITE_WIDTH_A parameter
				.DIB(DIB),       // Input port-B data, width defined by WRITE_WIDTH_B parameter
				.ENA(ENA),       // 1-bit input port-A enable
				.ENB(ENB),       // 1-bit input port-B enable
				.REGCEA(REGCEA), // 1-bit input port-A output register enable
				.REGCEB(REGCEB), // 1-bit input port-B output register enable
				.RSTA(RSTA),     // 1-bit input port-A reset
				.RSTB(RSTB),     // 1-bit input port-B reset
				.WEA(WEA),       // Input port-A write enable, width defined by Port A depth
				.WEB(WEB)        // Input port-B write enable, width defined by Port B depth
			);
		end
	endgenerate

endmodule