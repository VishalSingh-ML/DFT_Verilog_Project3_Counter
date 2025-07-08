module counter (
    input clk,
    input rst_n,        // Active-low synchronous reset
    output reg [3:0] q  // 4-bit counter output
);

always @(posedge clk) begin
    if (!rst_n)
        q <= 4'b0000;   // Reset to 0
    else
        q <= q + 1;     // Increment on every posedge
end

endmodule
