module Memory
(
    input                    clk,
    input                    rst,
    input                    MEM_W_EN,
    input                    MEM_R_EN,
    input  [31:0]            ALU_res,
    input  [31:0]            Val_Rm,
    
    output [31:0]            MEM_out
);

    wire [31:0] generatedAddr = {ALU_res[31:2], 2'b00} - 32'd1024;

    reg [7:0] mem_data [0:256];

	integer i;

	always @(posedge clk, posedge rst) begin
		if (rst) begin
				for (i = 0; i < 256; i = i + 1)
					mem_data [i] <= 0;
    end
		else if (MEM_W_EN) begin	
                mem_data[generatedAddr] <= Val_Rm[7:0];
                mem_data[{generatedAddr[31:2], 2'b01}] <= Val_Rm[15:8];
                mem_data[{generatedAddr[31:2], 2'b10}] <= Val_Rm[23:16];
                mem_data[{generatedAddr[31:2], 2'b11}] <= Val_Rm[31:24];
		end
	end
    assign MEM_out = MEM_R_EN ? {mem_data[{generatedAddr[31:2], 2'b11}], mem_data[{generatedAddr[31:2], 2'b10}], 
                                 mem_data[{generatedAddr[31:2], 2'b01}], mem_data[{generatedAddr}]}: 32'b0;

endmodule