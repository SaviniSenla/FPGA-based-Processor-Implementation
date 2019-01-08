 module BaudGen(input start,input clock,output boudtick);
        //parameterize the clock 
        parameter clockfreq=50000000;   //common mcu freuquncy
        parameter boudrate=115200;
        parameter overSamplingMultiplier=1;
        parameter multiplier=clockfreq/(boudrate*overSamplingMultiplier);
        
           
    
        function integer size(input integer inputVal);begin 
            size=0; 
            while(inputVal>>size) begin 
                size=size+1; 
            end 
        end
        endfunction
    
        localparam accumulatorWidth =  size(clockfreq/(boudrate*overSamplingMultiplier));  
        reg [accumulatorWidth-1:0] accumulator=0;
        reg flag=0;
        always @(posedge clock) begin 
            if ((accumulator==multiplier/2))begin 
                accumulator=0;
                flag=~flag;
                
            end
            if(~start) begin   
            accumulator=0;
            flag=0;
            end
        accumulator=accumulator+1;
        end
            assign boudtick=flag;
    endmodule
    