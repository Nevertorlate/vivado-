`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/11 20:55:42
// Design Name: 
// Module Name: Regfile
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


module Regfile(
    input CLK,
    input Wre,
    // input CLR,
    input [4:0] RdReg1addr,
    input [4:0] RdReg2addr,
    input [4:0] WrRegaddr,
    input [31:0] indata,
    output [31:0] reg1dataOut,
    output [31:0] reg2dataOut
    );
    reg     [31:0]  register [31:0];             // �Ĵ������32λ����31����R1 -Rr31
   integer  i;                                // ����

    assign reg1dataOut = (RdReg1addr== 0)? 0 : register[RdReg1addr];   // ���Ĵ���1����
    assign reg2dataOut = (RdReg2addr== 0)? 0 : register[RdReg2addr];   // ���Ĵ���2����

    // psedge?
    always @(negedge CLK ) begin
        if ((WrRegaddr != 0) && (Wre == 1))     // $0�Ĵ��������޸�
          register[WrRegaddr] <= indata;        // д�Ĵ�������������ֵ"<="
    end

        initial begin
            for (i=1; i<32; i=i+1) begin
                    register[i] <= 0;                     // �Ĵ�����0����������ֵ"<="
            end
        end

endmodule
