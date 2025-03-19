module Comparator_4bit_str(
    input [3:0] A,    // Số thứ nhất (4-bit)
    input [3:0] B,    // Số thứ hai (4-bit)
    output A_greater, // A > B
    output A_equal,   // A == B
    output A_less     // A < B
);

// Các tín hiệu phụ
wire [3:0] A_gt_B, A_eq_B, A_lt_B;


xor (A_eq_B[3], A[3], B[3]); // So sánh bit 3
and (A_gt_B[3], A[3], ~B[3]);
and (A_lt_B[3], ~A[3], B[3]);

xor (A_eq_B[2], A[2], B[2]); // So sánh bit 2
and (A_gt_B[2], A[2], ~B[2]);
and (A_lt_B[2], ~A[2], B[2]);

xor (A_eq_B[1], A[1], B[1]); // So sánh bit 1
and (A_gt_B[1], A[1], ~B[1]);
and (A_lt_B[1], ~A[1], B[1]);

xor (A_eq_B[0], A[0], B[0]); // So sánh bit 0
and (A_gt_B[0], A[0], ~B[0]);
and (A_lt_B[0], ~A[0], B[0]);


or (A_greater, A_gt_B[3], A_gt_B[2], A_gt_B[1], A_gt_B[0]);   
or (A_less, A_lt_B[3], A_lt_B[2], A_lt_B[1], A_lt_B[0]);
and (A_equal, ~A_eq_B[3], ~A_eq_B[2], ~A_eq_B[1], ~A_eq_B[0]);

endmodule
