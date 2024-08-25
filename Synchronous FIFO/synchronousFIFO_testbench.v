`timescale 1ns / 1ps


//////////////////////////////////////////////////////////////////////////////////
// Name: Yaduraj singh tomar
// Roll no. 231040124
// Department of Electical Engineering
// Indian Institute Of Technology
// Create Date:    20:12:23 20/07/2024
// Design Name: Synchronus FIFO
// Module Name:    Syn_FIFO 
// Project Name: Synchronous FIFO Design
// 
//
//////////////////////////////////////////////////////////////////////////////////

`define BUF_WIDTH 3

module Test_Sync_FIFO();
reg clk, rst, wr_en, rd_en ;
reg[7:0] buf_in;
reg[7:0] tempdata;
wire [7:0] buf_out;
wire [`BUF_WIDTH :0] fifo_counter;

Sync_FIFO ff( .clk(clk), .rst(rst), .buf_in(buf_in), .buf_out(buf_out), 
         .wr_en(wr_en), .rd_en(rd_en), .buf_empty(buf_empty), 
         .buf_full(buf_full), .fifo_counter(fifo_counter) );

initial
begin
   clk = 0;
   rst = 1;
        rd_en = 0;
        wr_en = 0;
        tempdata = 0;
        buf_in = 0;


        #15 rst = 0;
  
        push(1);
        fork
           push(2);
           pop(tempdata);
        join              //push and pop together   
        push(10);
        push(20);
        push(30);
        push(40);
        push(50);
        push(60);
        push(70);
        push(80);
        push(90);
        push(100);
        push(110);
        push(120);
        push(130);

        pop(tempdata);
        push(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
		  push(140);
        pop(tempdata);
        push(tempdata);//
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        pop(tempdata);
        push(5);
        pop(tempdata);
end

always
   #5 clk = ~clk;

task push;
input[7:0] data;


   if( buf_full )
            $display("---Cannot push: Buffer Full---");
        else
        begin
           $display("Pushed ",data );
           buf_in = data;
           wr_en = 1;
                @(posedge clk);
                #1 wr_en = 0;
        end

endtask

task pop;
output [7:0] data;

   if( buf_empty )
            $display("---Cannot Pop: Buffer Empty---");
   else
        begin

     rd_en = 1;
          @(posedge clk);

          #1 rd_en = 0;
          data = buf_out;
           $display("-------------------------------Poped ", data);

        end
endtask

endmodule

