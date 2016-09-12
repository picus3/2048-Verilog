`timescale 1ns / 1ps

module ee201_2048_top
		(MemOE, MemWR, RamCS, FlashCS, QuadSpiFlashCS, // Disable the three memory chips

        ClkPort,                           // the 100 MHz incoming clock signal
		
		BtnL, BtnU, BtnD, BtnR,            // the Left, Up, Down, and the Right buttons BtnL, BtnR,
		BtnC,                              // the center button (this is our reset in most of our designs)
		GB, 								//Represents the Game Board	
		//VGA Signals				        //
	  );

	input		ClkPort;	
	// Project Specific Inputs
	input		BtnL, BtnU, BtnD, BtnR, BtnC;	
	
	//Outputs
	output 	MemOE, MemWR, RamCS, FlashCS, QuadSpiFlashCS;
	output [10:0] GB [0:3][0:3];
	//output VGA Signals /* TO DO*/
	
	
	/*  LOCAL SIGNALS */
	wire		Reset, ClkPort;
	 		
	reg [26:0]	DIV_CLK; /*TO DO*/ //DO I Need
	wire Left_Pulse, Reset_Pulse, Right_Pulse, Up_Pulse, Down_Pulse;
	wire [2:0] Left_Pulse_Count, Right_Pulse_Count, Up_Pulse_Count, Down_Pulse_Count;
	wire flag;
	wire q_PLAY, q_LOSE, q_WIN;
	reg [2:0] state;
//------------	
// Disable the three memories so that they do not interfere with the rest of the design.
	assign {MemOE, MemWR, RamCS, FlashCS, QuadSpiFlashCS} = 5'b11111;
	
	//Reset Signal 
	assign Reset = BtnC;
	assign state = {q_PLAY, q_LOSE, q_WIN};
	
 //------------   
    //Debounce the Signals
    ee201_debouncer #(.N_dc(28)) ee201_debouncer_0 
        (.CLK(ClkPort), .RESET(Reset), .PB(BtnL), .DPB( ), 
		.SCEN(Left_Pulse), .MCEN( ), .CCEN( ));
	ee201_debouncer #(.N_dc(28)) ee201_debouncer_1 
        (.CLK(ClkPort), .RESET(Reset), .PB(BtnR), .DPB( ), 
		.SCEN(Right_Pulse), .MCEN( ), .CCEN( ));
	ee201_debouncer #(.N_dc(28)) ee201_debouncer_2 
        (.CLK(ClkPort), .RESET(Reset), .PB(BtnU), .DPB( ), 
		.SCEN(Left_Pulse), .MCEN( ), .CCEN( ));
	ee201_debouncer #(.N_dc(28)) ee201_debouncer_3 
        (.CLK(ClkPort), .RESET(Reset), .PB(BtnD), .DPB( ), 
		.SCEN(Down_Pulse), .MCEN( ), .CCEN( ));
		
		
		
//------------
	//State Machine
	always @ (posedge ClkPort, posedge Reset)
	begin
	integer x, y, win;
		if (RESET)
			state <= 3'b100;
		else if (state = 3'b100)
			begin
			/*TO DO*/ //Play logic
			win = 0;
		    for (y=0,y<4,y=y+1) 
		    begin 
		    	for (x=0,x<4,x=x+1)
		    	begin
		    		if (date[x][y] == 11'b10000000000)
		    			win = 1;
		    	 end
		    end
			if (win)
				state <= 3'b010;
			end
	
	
	
	end
	
	
	
	
	//Game Play
	always @(posedge ClkPort, posedge Reset)
	begin
		integer x, y;
		//Reset
		if (Reset)
		begin
		for (x=0,x<4,x=x+1) 
		begin
      		for (y=0,y<4,y=y+1) 
      		begin
       			 data[x][y] <= 11'b00000000000;
       		end
       	end
       	end
       	
       	//GamePlay Input
       	else if (Left_Pulse) 
       	begin
       		Left_Pulse_Count <= 0;
       		flag <= 0;
       	end
       	else if (Right_Pulse) 
       	begin
       		Right_Pulse_Count <= 0;
       		flag <= 0;
       	end
       	else if (Up_Pulse) 
       	begin
       		Up_Pulse_Count <= 0;
       		flag <= 0;
       	end
       	else if (Down_Pulse) 
       	begin
       		Down_Pulse_Count <= 0;
       		flag <= 0;
       	end
    end
       	
       		
       
       
     //Update Board
      always @(posedge ClkPort) 
       
       	begin
       		if(Left_Pulse_Count < 5) 
			begin
			Left_Pulse_Count <=  Left_Pulse_Count +1;
			x = Left_Pulse_Count;
      			for (y=0,y<4,y=y+1) 
      			wire temp = x + 1;
				begin
					if (x == 4 && data[3][y] == 11'b00000000000 && flag == 0)
					begin 
						flag == 1;
						data[3][y] <= 11'b00000000001;
					end
					else if (data[x][y] == data[temp][y])
					begin
						data[x][y] <= data [x][y]*2;
						data[temp][y] <= 11'b00000000000; 
					end
					else if (data[x][y] == 11'b00000000000)
					begin
						data[x][y] <= data[x+1][y];
						data[temp][y] <= 11'b00000000000; 
					end
				end
			end
			
			if(Right_Pulse_Count < 5) 
			begin
			Right_Pulse_Count <= Right_Pulse_Count+1;
			x = Right_Pulse_Count;
			wire temp = 3-x;
			wire next = 2-x;
      			for (y=0,y<4,y=y+1) 
				begin
					if (x == 4 && data[0][y] == 11'b00000000000 && flag == 0)
					begin 
						flag == 1;
						data[0][y] <= 11'b00000000001;
					end
					else if (data[temp][y] == data[next][y])
					begin
						data[temp][y] <= data [temp][y]*2;
						data[next][y] <= 11'b00000000000; 
					end
					else if (data[temp][y] == 11'b00000000000)
					begin
						data[temp][y] <= data[next][y];
						data[next][y] <= 11'b00000000000; 
					end
				end
			end
			
			if(Up_Pulse_Count < 5) 
			begin
			Up_Pulse_Count <= Up_Pulse_Count +1;
			wire temp =  Up_Pulse_Count;
			wire next =  Up_Pulse_Count + 1;
      			for (x=0,x<4,x=y+1) 
				begin
					if (x == 4 && data[x][3] == 11'b00000000000 && flag == 0)
					begin 
						flag == 1;
						data[x][3] <= 11'b00000000001;
					end
					else if (data[x][temp] == data[x][next])
					begin
						data[x][temp] <= data [x][temp]*2;
						data[x][next] <= 11'b00000000000; 
					end
					else if (data[x][temp] == 11'b00000000000)
					begin
						data[x][temp] <= data[x][next];
						data[x][next] <= 11'b00000000000; 
					end
				end
			end
			
			if(Down_Pulse_Count < 5) 
			begin
			wire temp =  3 - Down_Pulse_Count;
			wire next =  2 - Down_Pulse_Count;
      			for (x=0,x<4,x=x+1) 
				begin
					if (x == 4 && data[x][3] == 11'b00000000000 && flag == 0)
					begin 
						flag == 1;
						data[x][3] <= 11'b00000000001;
					end
					else if (data[x][temp] == data[x][next])
					begin
						data[x][temp] <= data [x][temp]*2;
						data[x][next] <= 11'b00000000000; 
					end
					else if (data[x][temp] == 11'b00000000000)
					begin
						data[x][temp] <= data[x][next];
						data[x][next] <= 11'b00000000000; 
					end
				end
			end
		end
		
		
		//Check For Lost
		if({Down_Pulse_Count, Down_Pulse_Count, Down_Pulse_Count, Down_Pulse_Count} == 4'd5555 && flag == 0)
			state == 3'b001;
	end
		
		