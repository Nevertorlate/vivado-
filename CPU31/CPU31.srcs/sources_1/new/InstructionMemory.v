`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/11 21:18:45
// Design Name: 
// Module Name: InstructionMemory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module InstructionMemory(
    input [31:0] Iaddr, // ָ��洢����ַ����˿�
    // input [31:0] IDataIn,  // ָ��洢����������˿ڣ�ָ���������˿ڣ�
    input RW,      // ָ��洢����д�����źţ�Ϊ1д��Ϊ0��
    output reg[31:0] IDataOut // ָ��洢����������˿ڣ�ָ���������˿ڣ�
    );

    reg[7:0] storage [127:0];

     always @(RW or Iaddr ) begin
           if(RW == 1) begin //write
            /* ����ʵ�鲻��Ҫ�õ�дָ���
               storage[Iaddr] <= IDataIn[7:0];
               storage[Iaddr + 1] <= IDataIn[15:8];
               storage[Iaddr + 2] <= IDataIn[23:16];
               storage[Iaddr + 3] <= IDataIn[31:24];
            */
               end
           else begin // read
               IDataOut[7:0] <= storage[Iaddr + 3];
               IDataOut[15:8] <= storage[Iaddr + 2];
               IDataOut[23:16] <= storage[Iaddr + 1];
               IDataOut[31:24] <= storage[Iaddr];
                end  
       end

       initial begin
            $readmemb("F:/ECOP_Experiment/CPU/CPU.srcs/sources_1/new/ins.txt",storage);
       end


endmodule
