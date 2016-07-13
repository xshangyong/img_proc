`timescale 1ns / 1ps

module sram(
	sram_data, 
	sram_addr,
	sram_cs, 
	sram_oe, 
	sram_we, 
	sram_byte);

    parameter addr_bits =       18;
    parameter data_bits =       16;
    parameter mem_sizes = 	  	262143;
						
    inout     [data_bits - 1 : 0] sram_data;
    input     [addr_bits - 1 : 0] sram_addr;
    input                         sram_cs;
    input                         sram_oe;
    input                         sram_we;
    input                         sram_byte;
	
    reg		[data_bits - 1 : 0] mem [0 : mem_sizes];
	reg		data_flag;
	reg		[data_bits - 1 : 0] sram_data_r;
	assign	  sram_data = data_flag ? sram_data_r : 16'bzzzz_zzzz_zzzz_zzzz;
	always@(*) begin
		if(!sram_oe) begin
			sram_data_r = mem[sram_addr];
			data_flag = 1;
		end	
		
		else begin
			data_flag = 0;
		end
	
	end
	
	always@(negedge sram_we) begin
		mem[sram_addr] = sram_data;
	end
endmodule


