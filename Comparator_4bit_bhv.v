module Comparator_4bit_bhv(
    input [3:0] A,    // Số thứ nhất (4-bit)
    input [3:0] B,    // Số thứ hai (4-bit)
    output A_greater, // A > B
    output A_equal,   // A == B
    output A_less     // A < B
);


assign A_greater = (A > B) ? 1 : 0;
assign A_equal   = (A == B) ? 1 : 0;
assign A_less    = (A < B) ? 1 : 0;

endmodule
