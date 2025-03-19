module T_flip_flop (
    input T,       // T (Toggle) input
    input clk,     // Clock input
    input rst,     // Asynchronous Reset
    input PRN,     // Preset (active low)
    input CLRN,    // Clear (active low)
    output Q       // Output
);

    wire Q_int;    // Internal Q output from D flip-flop
    wire D_in;     // Input to D flip-flop
    wire not_Q;    // Inverted Q
    wire rst_int;  // Internal reset signal combining rst, PRN, CLRN
    wire preset_int; // Internal preset signal

    // Logic for T flip-flop: Q toggles when T = 1
    not (not_Q, Q_int);              // Invert Q
    xor (D_in, T, Q_int);            // D_in = T XOR Q (toggle logic)

    // Asynchronous control logic
	or (rst_int, rst, ~CLRN);  // Tạo tín hiệu reset
    not (preset_int, PRN);        // Tạo tín hiệu preset

    // D flip-flop with asynchronous reset and preset
    D_FF dff (
        .q(Q_int),
        .qbar(),  // Không sử dụng
        .d(D_in),
        .clk(clk),
        .clear(rst_int),
        .preset(preset_int)
    );

    buf (Q, Q_int);               // Output Q

endmodule


module D_FF(
    output q, qbar,
    input d, clk, clear, preset
);
    wire s, sbar, r, rbar, cbar, pbar, clkbar;

    not (cbar, clear);
    not (pbar, preset);
    not (clkbar, clk);
    
    // Input latches
    nand (sbar, rbar, s);
    nand (s, sbar, cbar, clkbar);
    nand (r, rbar, clkbar, s);
    nand (rbar, r, cbar, d);
    
    // Output latch with preset
    nand (q, s, qbar, pbar);
    nand (qbar, q, r, cbar);

endmodule
