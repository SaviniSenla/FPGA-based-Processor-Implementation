 module Transmitter(
        input clock,
        input Tx_start,
        input [7:0] TxD_data,
        output TxD,
        output TxD_busy
    );
        // registry to freeze the data when transmission started and to store the state
    
        reg [7:0] data=0;
        reg [3:0] state=0;
    
        reg dataBit=1;
        reg flag=0;
        assign TxD=dataBit;
        assign TxD_busy=flag;
        
        
        
        wire transmeterClock;
        BaudGen  localclockOS(.start(TxD_busy),.clock(clock),.boudtick(boudgen));
        assign transmeterClock=TxD_busy?boudgen:clock;
        
    
        //Data transmission
        always @(posedge transmeterClock) begin
        
            if (flag) begin
                case (state)
                    4'b0001:begin   // this should be improved by adding this part to else part
                            
                            dataBit<=0;
                            state<=state+1;
                        end
                    4'b0010:begin 	
                            
                            dataBit<=data[0];
                            state<=state+1;
                        end
                    4'b0011:begin 
                            
                            dataBit<=data[1];
                            state<=state+1;
                        end
                    4'b0100:begin
                            
                            dataBit<=data[2];
                            state<=state+1;
                        end
                    4'b0101:begin 
                            
                            dataBit<=data[3];
                            state<=state+1;
                        end
                    4'b0110:begin 
                            
                            dataBit<=data[4];
                            state<=state+1;
                        end
                    4'b0111:begin 
                            
                            dataBit<=data[5];
                            state<=state+1;
                        end
                    4'b1000:begin 
                            
                            dataBit<=data[6];
                            state<=state+1;
                        end
                    4'b1001:begin 
                            
                            dataBit<=data[7];
                            state<=state+1;
                        end
                    4'b1010:begin  
                            
                            dataBit<=0;
                            state<=state+1;
                        end
                    default:begin   
                            
                            state<=0;
                            dataBit<=1;
                            flag<=0;
                        end
                endcase
                end
                else begin
                      if(Tx_start) begin
                              state<=1;
                              flag<=1;
                              data<=TxD_data;
                              end  
                 end
        
        end
        
    endmodule
    