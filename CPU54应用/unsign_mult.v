`timescale 1ns / 1ps//������ȷ���
module unsign_mult(input enable_signal,input clock_in,input reset,input [63:0]input_data1,output [63:0]out_data,output reg busy) ;
reg [5:0]data_sel =0;reg [63:0]temp_data;assign out_data = temp_data;//�ݴ�˷�������Ĵ���
always@(clock_in)//ʱ�������ź�
begin if(reset)temp_data=0;
else if(enable_signal)begin temp_data[63:0] ={32'b0,input_data1[63:32]};busy = 1;end
else if(busy)begin data_sel=data_sel + 1;if((data_sel)== 15)begin busy = 0;temp_data = input_data1[31:0]*input_data1[63:32];end end end endmodule