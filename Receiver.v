module Receiver(input clock,input data,output reg [7:0] character,output reg dataReady=0);
    //flags and state registry definitions
    reg flagStart=0;
    reg [3:0]state=0;
    wire w1;
    
    //clock for data sampling
    BaudGen localclockOS(.start(flagStart),.clock(clock),.boudtick(w1));
    
    
    //filter for glitches in input data
    reg [1:0] filter=2'b11;
    
    wire activeClock;
    assign activeClock=flagStart?w1:clock;
    //Reading input data as a stream of data bits
    always @(posedge activeClock ) begin
        
        
        if (flagStart) begin
            case (state)	
                4'b0000:begin 
                        state<=state+1;
                    end
                4'b0001:begin 
                        character[0]<=data;
                        state<=state+1;
                    end
                4'b0010:begin 
                        character[1]<=data;
                        state<=state+1;
                    end
                4'b0011:begin 
                        character[2]<=data;
                        state<=state+1;
                    end
                4'b0100:begin
                        character[3]<=data;
                        state<=state+1;
                    end
                4'b0101:begin 
                        character[4]<=data;	
                        state<=state+1;
                    end
                4'b0110:begin 
                        character[5]<=data;	
                        state<=state+1;
                    end
                4'b0111:begin 
                        character[6]<=data;
                        state<=state+1;
                    end
                4'b1000:begin 
                        character[7]<=data;	
                        state<=state+1;
                    end
                4'b1001:begin 	
                        
                        //state<=state+1;
                        flagStart<=0;
                        state<=0;
                        dataReady<=1;   /// this is veryfied.fpga was able to identify any recieved value//
                        
                        
                        
                    end
                    default begin
                        
                        flagStart<=0;
                        state<=0;
                        //dataReady<=1;
                    end
    
            endcase	
        end
        else begin
            if(dataReady) begin             
                dataReady<=0;            
            end
            else begin 
            filter<={filter[0],data};
                 if (~(filter[1]|filter[0])) begin
                    flagStart<=1;
                    filter<=2'b11;
                 end
             end
        end
    end 
    
    // dataReady is asserted when complete byte is arrived
    endmodule 