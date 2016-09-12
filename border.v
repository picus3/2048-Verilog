module border (x,y,red,green,blue);

input [9:0] x;
input [9:0] y;
output [2:0] red;
output [2:0] green; 
output [1:0] blue;

always @ (y)
	begin
		if (y <= 12)
			begin	
				red <= 3'b000;
				green <= 3'b000;
				blue <= 2'b00;
			end
		else if (117 <= y <= 129)
			begin	
				red <= 3'b000;
				green <= 3'b000;
				blue <= 2'b00;
			end
		else if (234 <= y <= 246)
			begin	
				red <= 3'b000;
				green <= 3'b000;
				blue <= 2'b00;
			end
		else if (351 <= y <= 363)
			begin	
				red <= 3'b000;
				green <= 3'b000;
				blue <= 2'b00;
			end
		else if (y >= 468)
			begin	
				red <= 3'b000;
				green <= 3'b000;
				blue <= 2'b00;
			end
		else 
			begin	
				red <= 3'b111;
				green <= 3'b111;
				blue <= 2'b11;
			end
	end
					
always @ (x)
	begin
		
		if (x <= 10)
			begin
				red <= 3'b000;
				green <= 3'b000;
				blue <= 2'b00;
			end
		else if (155 <= x <= 175)
			begin
				red <= 3'b000;
				green <= 3'b000;
				blue <= 2'b00;
			end
		else if (315 <= x <= 335)
			begin
				red <= 3'b000;
				green <= 3'b000;
				blue <= 2'b00;
			end
		else if (475 <= x <= 485)
			begin
				red <= 3'b000;
				green <= 3'b000;
				blue <= 2'b00;
			end
		else if (x >= 630)
			begin
				red <= 3'b000;
				green <= 3'b000;
				blue <= 2'b00;
			end
		else 
			begin
				red <= 3'b111;
				green <= 3'b111;
				blue <= 2'b11;
			end
	end
	
endmodule
