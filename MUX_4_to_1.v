module MUX_4_to_1
(
    select,
    inp1,
    inp2,
    inp3,
    inp4,
    out
);

    parameter                              WORD_WIDTH = 32;
    input      [1:0]                       select;
    input      [WORD_WIDTH-1:0]            inp1, inp2, inp3, inp4;
    output reg [WORD_WIDTH-1:0]            out;

    always @(select, inp1, inp2) begin
        out = 0;

        case(select)
            2'b00: out = inp1;
            2'b01: out = inp2;
            2'b10: out = inp3;
            2'b11: out = inp4;
            default: out = 0;
        endcase
        
    end

endmodule
