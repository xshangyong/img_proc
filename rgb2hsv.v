module rgb2hsv
(
	input[15:0]		rgb_in			;
	input			rgb_clk_in		;
	input			rgb_fram_valid	;
	input			rgb_data_valid	;
	output[15:0]	hsv_out			;
	output			hsv_clk_out    	;
	output			hsv_fram_valid 	
);	
	reg		hsv_out;
	reg		hsv_clk_out;
	reg		hsv_fram_valid;
	
	wire[4:0]	red;
	wire[5:0]	green;
	wire[4:0]	blue;
	
	assign red[4:0]   =  rgb_in[15:11];
	assign green[5:0] =  rgb_in[10:5];
	assign blue[4:0]  =  rgb_in[4:0];

	always@(posedge cmos_pclk)begin

	end
endmodule
