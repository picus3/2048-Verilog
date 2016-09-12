module box (offset_x, offset_y, number, CounterX, CounterY, red, blue, green);

input [11:0] offset_x;
input [11:0] offset_y;
input [11:0] number;
input [10:0] CounterX;
input [10:0] CounterY;
output [2:0] red;
output [2:0] green; 
output [1:0] blue;


reg dp0;
reg dp2;
reg dp4;
reg dp8;
reg dp16;
reg dp32;
reg dp64;
reg dp128;
reg dp256;
reg dp512;
reg dp1024;
reg dp2048;

always @ (offset_x, offset_y, CounterX, CounterY)
	begin
		if ((((offset_x + 65) <= CounterX <= (offset_x + 85)) | ((offset_x + 90) <= CounterX <= (offset_x + 100))) & ((offset_y + 30) <= CounterY <= (offset_y + 70)) &
			(((offset_y + 70) <= CounterY <= (offset_y + 80)) | ((offset_y + 20) <= CounterY <= (offset_y + 30))) & ((offset_x + 60) <= CounterX <= (offset_x + 90)))
			dp0 = 1;
		else 
			dp0 = 0;
	end
	
always @ (offset_x, offset_y, CounterX, CounterY)
	begin
		if ((((offset_x + 65) <= CounterX <= (offset_x + 85)) & ((offset_y + 20) <= CounterY <= (offset_y + 30))) &
			((((offset_x + 55) <= CounterX <= (offset_x + 65)) | ((offset_x + 85) <= CounterX <= (offset_x + 95))) & ((offset_y + 30) <= CounterY <= (offset_y + 40))) &
			((((offset_x + 85) <= CounterX <= (offset_x + 95)) | ((offset_x + 90) <= CounterX <= (offset_x + 100))) & ((offset_y + 40) <= CounterY <= (offset_y + 50))) &
			(((offset_x + 75) <= CounterX <= (offset_x + 85)) & ((offset_y + 50) <= CounterY <= (offset_y + 60))) &
			(((offset_x + 65) <= CounterX <= (offset_x + 75)) & ((offset_y + 60) <= CounterY <= (offset_y + 70))) &
			(((offset_x + 55) <= CounterX <= (offset_x + 95)) & ((offset_y + 70) <= CounterY <= (offset_y + 80)))) &
			dp2 = 1;
		else 
			dp2 = 0;
	end
	
always @ (offset_x, offset_y, CounterX, CounterY)
	begin
		if ((((offset_x + 65) <= CounterX <= (offset_x + 90)) & ((offset_y + 20) <= CounterY <= (offset_y + 30))) &
			((((offset_x + 60) <= CounterX <= (offset_x + 70)) | ((offset_x + 80) <= CounterX <= (offset_x + 90))) & ((offset_y + 30) <= CounterY <= (offset_y + 40))) &
			((((offset_x + 55) <= CounterX <= (offset_x + 65)) | ((offset_x + 80) <= CounterX <= (offset_x + 90))) & ((offset_y + 40) <= CounterY <= (offset_y + 50))) &
			(((offset_x + 50) <= CounterX <= (offset_x + 100)) & ((offset_y + 50) <= CounterY <= (offset_y + 60))) &
			(((offset_x + 80) <= CounterX <= (offset_x + 90)) & ((offset_y + 60) <= CounterY <= (offset_y + 70))) &
			(((offset_x + 80) <= CounterX <= (offset_x + 90)) & ((offset_y + 70) <= CounterY <= (offset_y + 80)))) &
			dp4 = 1;
		else 
			dp4 = 0;
	end

always @ (offset_x, offset_y, CounterX, CounterY)
	begin
		if ((((offset_x + 65) <= CounterX <= (offset_x + 85)) & (((offset_y + 15) <= CounterY <= (offset_y + 25)) | ((offset_y + 40) <= CounterY <= (offset_y + 50)) | ((offset_y + 70) <= CounterY <= (offset_y + 80)))) &
			((((offset_x + 55) <= CounterX <= (offset_x + 65)) | ((offset_x + 85) <= CounterX <= (offset_x + 95))) & (((offset_y + 25) <= CounterY <= (offset_y + 40)) | ((offset_y + 50) <= CounterY <= (offset_y + 70)))))
			dp8 = 1;
		else 
			dp8 = 0;
	end
	
always @ (offset_x, offset_y, CounterX, CounterY)
	begin
		if (((((offset_x + 55) <= CounterX <= (offset_x + 65)) | ((offset_x + 85) <= CounterX <= (offset_x + 105))) & ((offset_y + 20) <= CounterY <= (offset_y + 30))) &
			((((offset_x + 45) <= CounterX <= (offset_x + 65)) | ((offset_x + 75) <= CounterX <= (offset_x + 85))) & ((offset_y + 30) <= CounterY <= (offset_y + 40))) &
			(((offset_x + 55) <= CounterX <= (offset_x + 65)) | ((offset_x + 75) <= CounterX <= (offset_x + 90)) & ((offset_y + 40) <= CounterY <= (offset_y + 50))) &
			(((offset_x + 55) <= CounterX <= (offset_x + 65)) | ((offset_x + 75) <= CounterX <= (offset_x + 85)) | ((offset_x + 105) <= CounterX <= (offset_x + 115))& ((offset_y + 50) <= CounterY <= (offset_y + 60))) &
			(((offset_x + 55) <= CounterX <= (offset_x + 65)) | ((offset_x + 75) <= CounterX <= (offset_x + 85)) | ((offset_x + 105) <= CounterX <= (offset_x + 115)) & ((offset_y + 60) <= CounterY <= (offset_y + 70))) &
			((((offset_x + 45) <= CounterX <= (offset_x + 75)) | ((offset_x + 85) <= CounterX <= (offset_x + 105))) & ((offset_y + 70) <= CounterY <= (offset_y + 80)))) 
			dp16 = 1;
		else 
			dp16 = 0;
	end
	
always @ (offset_x, offset_y, CounterX, CounterY)
	begin
		if (((((offset_x + 40) <= CounterX <= (offset_x + 60)) | ((offset_x + 85) <= CounterX <= (offset_x + 105))) & ((offset_y + 20) <= CounterY <= (offset_y + 30))) &
			(((offset_x + 60) <= CounterX <= (offset_x + 70)) | ((offset_x + 75) <= CounterX <= (offset_x + 85)) | ((offset_x + 105) <= CounterX <= (offset_x + 115)) & ((offset_y + 30) <= CounterY <= (offset_y + 40))) &	
			((((offset_x + 40) <= CounterX <= (offset_x + 60)) | ((offset_x + 105) <= CounterX <= (offset_x + 115))) & ((offset_y + 40) <= CounterY <= (offset_y + 50))) &
			(((offset_x + 60) <= CounterX <= (offset_x + 70)) | ((offset_x + 95) <= CounterX <= (offset_x + 105)) & ((offset_y + 50) <= CounterY <= (offset_y + 60))) &
			((((offset_x + 60) <= CounterX <= (offset_x + 70)) | ((offset_x + 85) <= CounterX <= (offset_x + 195))) & ((offset_y + 60) <= CounterY <= (offset_y + 70))) &
			((((offset_x + 40) <= CounterX <= (offset_x + 60)) | ((offset_x + 75) <= CounterX <= (offset_x + 115))) & ((offset_y + 70) <= CounterY <= (offset_y + 80))))
			dp32 = 1;
		else 
			dp32 = 0;
	end

always @ (offset_x, offset_y, CounterX, CounterY)
	begin
		if (((((offset_x + 40) <= CounterX <= (offset_x + 60)) | ((offset_x + 90) <= CounterX <= (offset_x + 115))) & ((offset_y + 20) <= CounterY <= (offset_y + 30))) &
			(((offset_x + 30) <= CounterX <= (offset_x + 40)) | ((offset_x + 85) <= CounterX <= (offset_x + 95)) | ((offset_x + 105) <= CounterX <= (offset_x + 115)) & ((offset_y + 30) <= CounterY <= (offset_y + 40))) &	
			(((offset_x + 30) <= CounterX <= (offset_x + 60)) | ((offset_x + 80) <= CounterX <= (offset_x + 90)) | ((offset_x + 105) <= CounterX <= (offset_x + 115)) & ((offset_y + 40) <= CounterY <= (offset_y + 50))) &
			(((offset_x + 30) <= CounterX <= (offset_x + 40)) | ((offset_x + 60) <= CounterX <= (offset_x + 70)) | ((offset_x + 75) <= CounterX <= (offset_x + 125)) & ((offset_y + 50) <= CounterY <= (offset_y + 60))) &
			(((offset_x + 30) <= CounterX <= (offset_x + 40)) | ((offset_x + 60) <= CounterX <= (offset_x + 70)) | ((offset_x + 105) <= CounterX <= (offset_x + 115)) & ((offset_y + 60) <= CounterY <= (offset_y + 70))) &
			((((offset_x + 40) <= CounterX <= (offset_x + 60)) | ((offset_x + 105) <= CounterX <= (offset_x + 115))) & ((offset_y + 70) <= CounterY <= (offset_y + 80))))
			dp64 = 1;
		else 
			dp64 = 0;
	end

always @ (offset_x, offset_y, CounterX, CounterY)
	begin
		if ((((offset_x + 30) <= CounterX <= (offset_x + 40)) | ((offset_x + 55) <= CounterX <= (offset_x + 75)) | ((offset_x + 95) <= CounterX <= (offset_x + 115)) & ((offset_y + 20) <= CounterY <= (offset_y + 30))) &	
			((((offset_x + 15) <= CounterX <= (offset_x + 35)) | ((offset_x + 45) <= CounterX <= (offset_x + 55)) | ((offset_x + 65) <= CounterX <= (offset_x + 85)) | ((offset_x + 115) <= CounterX <= (offset_x + 125))) & ((offset_y + 30) <= CounterY <= (offset_y + 40))) &
			(((offset_x + 25) <= CounterX <= (offset_x + 35)) | ((offset_x + 75) <= CounterX <= (offset_x + 85)) | ((offset_x + 95) <= CounterX <= (offset_x + 115)) & ((offset_y + 40) <= CounterY <= (offset_y + 50))) &
			((((offset_x + 25) <= CounterX <= (offset_x + 35)) | ((offset_x + 65) <= CounterX <= (offset_x + 75)) | ((offset_x + 85) <= CounterX <= (offset_x + 95)) | ((offset_x + 115) <= CounterX <= (offset_x + 125))) & ((offset_y + 50) <= CounterY <= (offset_y + 60))) &
			((((offset_x + 25) <= CounterX <= (offset_x + 35)) | ((offset_x + 55) <= CounterX <= (offset_x + 65)) | ((offset_x + 85) <= CounterX <= (offset_x + 95)) | ((offset_x + 115) <= CounterX <= (offset_x + 125))) & ((offset_y + 60) <= CounterY <= (offset_y + 70))) &
			((((offset_x + 15) <= CounterX <= (offset_x + 85)) | ((offset_x + 95) <= CounterX <= (offset_x + 115))) & ((offset_y + 70) <= CounterY <= (offset_y + 80))))
			dp128 = 1;
		else 
			dp128 = 0;
	end

always @ (offset_x, offset_y, CounterX, CounterY)
	begin
		if ((((offset_x + 25) <= CounterX <= (offset_x + 45)) | ((offset_x + 60) <= CounterX <= (offset_x + 90)) | ((offset_x + 105) <= CounterX <= (offset_x + 125)) & ((offset_y + 20) <= CounterY <= (offset_y + 30))) &	
			((((offset_x + 15) <= CounterX <= (offset_x + 25)) | ((offset_x + 45) <= CounterX <= (offset_x + 55)) | ((offset_x + 60) <= CounterX <= (offset_x + 70)) | ((offset_x + 95) <= CounterX <= (offset_x + 105))) & ((offset_y + 30) <= CounterY <= (offset_y + 40))) &
			(((offset_x + 45) <= CounterX <= (offset_x + 55)) | ((offset_x + 60) <= CounterX <= (offset_x + 90)) | ((offset_x + 95) <= CounterX <= (offset_x + 125)) & ((offset_y + 40) <= CounterY <= (offset_y + 50))) &
			((((offset_x + 35) <= CounterX <= (offset_x + 45)) | ((offset_x + 80) <= CounterX <= (offset_x + 90)) | ((offset_x + 95) <= CounterX <= (offset_x + 105)) | ((offset_x + 125) <= CounterX <= (offset_x + 135))) & ((offset_y + 50) <= CounterY <= (offset_y + 60))) &
			((((offset_x + 25) <= CounterX <= (offset_x + 35)) | ((offset_x + 80) <= CounterX <= (offset_x + 90)) | ((offset_x + 95) <= CounterX <= (offset_x + 105)) | ((offset_x + 125) <= CounterX <= (offset_x + 135))) & ((offset_y + 60) <= CounterY <= (offset_y + 70))) &
			((((offset_x + 15) <= CounterX <= (offset_x + 55)) | ((offset_x + 60) <= CounterX <= (offset_x + 80)) | ((offset_x + 105) <= CounterX <= (offset_x + 125)) & ((offset_y + 70) <= CounterY <= (offset_y + 80))))
			dp256 = 1;
		else 
			dp256 = 0;
	end
	
always @ (offset_x, offset_y, CounterX, CounterY)
	begin
		if ((((offset_x + 25) <= CounterX <= (offset_x + 55)) | ((offset_x + 70) <= CounterX <= (offset_x + 80)) | ((offset_x + 95) <= CounterX <= (offset_x + 115)) & ((offset_y + 20) <= CounterY <= (offset_y + 30))) &	
			((((offset_x + 25) <= CounterX <= (offset_x + 35)) | ((offset_x + 60) <= CounterX <= (offset_x + 80)) | ((offset_x + 105) <= CounterX <= (offset_x + 115)) | ((offset_x + 115) <= CounterX <= (offset_x + 125))) & ((offset_y + 30) <= CounterY <= (offset_y + 40))) &
			(((offset_x + 25) <= CounterX <= (offset_x + 55)) | ((offset_x + 70) <= CounterX <= (offset_x + 80)) | ((offset_x + 115) <= CounterX <= (offset_x + 125)) & ((offset_y + 40) <= CounterY <= (offset_y + 50))) &
			(((offset_x + 45) <= CounterX <= (offset_x + 55)) | ((offset_x + 70) <= CounterX <= (offset_x + 80)) | ((offset_x + 105) <= CounterX <= (offset_x + 115))) & ((offset_y + 50) <= CounterY <= (offset_y + 60))) &
			(((offset_x + 45) <= CounterX <= (offset_x + 55)) | ((offset_x + 70) <= CounterX <= (offset_x + 80)) | ((offset_x + 95) <= CounterX <= (offset_x + 105))) & ((offset_y + 60) <= CounterY <= (offset_y + 70))) &
			((((offset_x + 25) <= CounterX <= (offset_x + 45)) | ((offset_x + 60) <= CounterX <= (offset_x + 125))) & ((offset_y + 70) <= CounterY <= (offset_y + 80))))
			dp512 = 1;
		else 
			dp512 = 0;
	end
	
always @ (offset_x, offset_y, CounterX, CounterY)
	begin
		case (number)
			11'b00000000000: 
				begin
					if (dp0)
						begin
						red <= 3'b000;
						green <= 3'b000;
						blue <= 2'b00;	
						end
				end
			12'b000000000001:
					begin
					if (dp1)
						begin
						red <= 3'b000;
						green <= 3'b000;
						blue <= 2'b00;	
						end
				end
			12'b000000000010:
					begin
					if (dp2)
						begin
						red <= 3'b000;
						green <= 3'b000;
						blue <= 2'b00;	
						end
				end
			12'b000000000100:
						begin
					if (dp4)
						begin
						red <= 3'b000;
						green <= 3'b000;
						blue <= 2'b00;	
						end
				end	
			12'b000000001000:
						begin
					if (dp8)
						begin
						red <= 3'b000;
						green <= 3'b000;
						blue <= 2'b00;	
						end
				end
			12'b000000010000:
						begin
					if (dp16)
						begin
						red <= 3'b000;
						green <= 3'b000;
						blue <= 2'b00;	
						end
				end
			12'b000000100000:
						begin
					if (dp32)
						begin
						red <= 3'b000;
						green <= 3'b000;
						blue <= 2'b00;	
						end
				end
			12'b000001000000:
						begin
					if (dp64)
						begin
						red <= 3'b000;
						green <= 3'b000;
						blue <= 2'b00;	
						end
				end
			12'b000010000000:
						begin
					if (dp256)
						begin
						red <= 3'b000;
						green <= 3'b000;
						blue <= 2'b00;	
						end
				end
			12'b000100000000:
					begin
					if (dp512)
						begin
						red <= 3'b000;
						green <= 3'b000;
						blue <= 2'b00;	
						end
				end
			12'b001000000000:
						begin
					if (dp1024)
						begin
						red <= 3'b000;
						green <= 3'b000;
						blue <= 2'b00;	
						end
				end
			11'b10000000000:
						begin
					if (dp2048)
						begin
						red <= 3'b000;
						green <= 3'b000;
						blue <= 2'b00;	
						end
				end

	end	
		
endmodule
