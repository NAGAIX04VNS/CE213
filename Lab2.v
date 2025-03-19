module Lab2 (
    input clk,      // Clock input
    input rst,      // Reset input
    input EN,       // Enable input
    input [2:0] SW,       // Switch input
    output [2:0] Q  // 3-bit output
);


wire T0, T1, T2;
wire PRN0, CLRN0, PRN1, CLRN1, PRN2, CLRN2;
wire nQ2, nQ1, nQ0;


not (nQ2, Q[2]);
not (nQ1, Q[1]);
not (nQ0, Q[0]);

wire term1_T0, term2_T0, term3_T0;
and (term1_T0, Q[2], nQ1);
and (term2_T0, nQ2, Q[1]);
and (term3_T0, nQ2, Q[0]);
or  (T0, term1_T0, term2_T0, term3_T0);

wire term1_T1, term2_T1, term3_T1;
or  (term1_T1, nQ1);
and (term2_T1, Q[2], nQ0);
and (term3_T1, nQ2, Q[0]);
or  (T1, term1_T1, term2_T1, term3_T1);

wire term1_T2, term2_T2, term3_T2;
and (term1_T2, Q[2], Q[0]);
and (term2_T2, nQ2, nQ1);
and (term3_T2, nQ2, nQ0);
or  (T2, term1_T2, term2_T2, term3_T2);


or(PRN0, EN, ~SW[0]);
or(CLRN0, EN, SW[0]);

or(PRN1, EN, ~SW[1]);
or(CLRN1, EN, SW[1]);

or(PRN2, EN, ~SW[2]);
or(CLRN2, EN, SW[2]);


// Instantiate T flip-flops
T_flip_flop FF0 (
    .T(T0),
    .clk(clk),
    .rst(rst),
    .PRN(PRN0),
    .CLRN(CLRN0),
    .Q(Q[0])
);

T_flip_flop FF1 (
    .T(T1),
    .clk(clk),
    .rst(rst),
    .PRN(PRN1),
    .CLRN(CLRN1),
    .Q(Q[1])
);

T_flip_flop FF2 (
    .T(T2),
    .clk(clk),
    .rst(rst),
    .PRN(PRN2),
    .CLRN(CLRN2),
    .Q(Q[2])
);
endmodule