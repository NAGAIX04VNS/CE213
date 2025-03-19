module Comparator_4bit_bhv_nonblocking(
    input [3:0] A,    // Số thứ nhất (4-bit)
    input [3:0] B,    // Số thứ hai (4-bit)
    output reg A_greater, // A > B
    output reg A_equal,   // A == B
    output reg A_less     // A < B
);

always @(*) begin
    if (A > B) begin
        A_greater <= 1;
        A_equal <= 0;
        A_less <= 0;
    end else if (A == B) begin
        A_greater <= 0;
        A_equal <= 1;
        A_less <= 0;
    end else begin
        A_greater <= 0;
        A_equal <= 0;
        A_less <= 1;
    end
end

endmodule
