module EXE_Stage_Reg
(
    input                             clk,
    input                             rst,
    input                             Freeze,
    input                             MEM_R_EN_in,
    input                             MEM_W_EN_in,
    input                             WB_EN_in,
    input      [3:0]                  Dest_in,
    input      [31:0]                 Val_Rm_in,
    input      [31:0]                 ALU_Res_in,

    output reg                        MEM_R_EN_out,
    output reg                        MEM_W_EN_out,
    output reg                        WB_EN_out,
    output reg [3:0]                  Dest_out,
    output reg [31:0]                 ALU_Res_out,
    output reg [31:0]                 Val_Rm_out
);

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            MEM_R_EN_out <= 0;
            MEM_W_EN_out <= 0;
            Dest_out <= 0;
            WB_EN_out <= 0;
            ALU_Res_out <= 0;
            Val_Rm_out <= 0;
        end
        else if(Freeze) begin
            MEM_R_EN_out <= MEM_R_EN_out;
            MEM_W_EN_out <= MEM_W_EN_out;
            Dest_out <= Dest_out;
            WB_EN_out <= WB_EN_out;
            ALU_Res_out <= ALU_Res_out;
            Val_Rm_out <= Val_Rm_out;
        end
        else begin
            MEM_R_EN_out <= MEM_R_EN_in;
            MEM_W_EN_out <= MEM_W_EN_in;
            Dest_out <= Dest_in;
            WB_EN_out <= WB_EN_in;
            ALU_Res_out <= ALU_Res_in;
            Val_Rm_out <= Val_Rm_in;
        end
    end

endmodule

