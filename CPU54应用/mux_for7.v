`timescale 1ns / 1ps//z��ȷ
module mux_for7(input first_nal,input [1:0]sel_nal,input [31:0]input_data1,input [31:0]input_data2,output reg [31:0]out_put);
always@(*)begin
case({sel_nal,input_data2[1:0]})
4'b1100,4'b1101,4'b1110,4'b1111:out_put = input_data1;
4'b1010,4'b1011:begin out_put[15:0] = input_data1[31:16];out_put[31:16] ={ first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15]};end
4'b1000,4'b1001:begin out_put[15:0] = input_data1[15:0] ;out_put[31:16] ={ first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15],first_nal&out_put[15]};end
4'b0100:begin out_put[7:0]=input_data1[7:0];out_put[31:8] ={first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7]};  end
4'b0101:begin out_put[7:0]=input_data1[15:8];out_put[31:8] ={first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7]};  end
4'b0110:begin out_put[7:0]=input_data1[23:16];out_put[31:8] ={first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7]};  end
4'b0111:begin out_put[7:0]=input_data1[31:24];out_put[31:8] ={first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7],first_nal&out_put[7]};  end
endcase end endmodule