module shift_register_tb;

reg clk, rst, scan_en, scan_in, d;
wire [3:0] q;

shift_register UUT (
    .clk(clk),
    .rst(rst),
    .scan_en(scan_en),
    .scan_in(scan_in),
    .d(d),
    .q(q)
);

initial begin
    $dumpfile("shift_reg.vcd");
    $dumpvars(0, shift_register_tb);
end

initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock
end

initial begin
    rst = 1; scan_en = 0; scan_in = 0; d = 0;
    #10 rst = 0;

    // Normal mode shifting
    d = 1; #10;
    d = 0; #10;
    d = 1; #10;

    // Scan mode shifting
    scan_en = 1;
    scan_in = 1; #10;
    scan_in = 0; #10;
    scan_in = 1; #10;

    $finish;
end

endmodule
