module PGLogic #(parameter N = 4) (
    input [N:0] G,
    input [N:0] P,
    output [N:0] C
);

    localparam depth = $clog2(N + 1);
    wire  [1: depth] g_arr [N:2] ;    // 0 is G, P itself
    wire  [1: depth] p_arr [N:2];     // [j 's] ... [i' s]

    assign C[0] = G[0];

    grey ginst1(
        .gleft(C[0]), .gtop(G[1]), .ptop(P[1]),
        .g(C[1])
    );    

    genvar i, j;

    generate
        for (i = 2; i <= N; i = i + 1) begin : bit_line
            for (j = 1; j <= $clog2(i + 1); j = j + 1) begin : depth
                if (j == 1) begin
                    black bl_inst(
                        .gleft(G[i-1]), .pleft(P[i-1]), .gtop(G[i]), .ptop(P[i]),
                        .g(g_arr[i][1]), .p(p_arr[i][1])
                    );
                end
                else if (j == $clog2(i + 1)) begin
                    grey ginst2(
                        .gleft(C[i-2**(j-1)]), .gtop(g_arr[i][j-1]), .ptop(p_arr[i][j-1]),
                        .g(C[i])
                    );
                end
                else begin
                    black bl_inst2(
                        .gleft(g_arr[i-2**(j-1)][j-1]), .pleft(p_arr[i-2**(j-1)][j-1]), .gtop(g_arr[i][j-1]), .ptop(p_arr[i][j-1]),
                        .g(g_arr[i][j]), .p(p_arr[i][j])
                    );
                end
            end
        end
    endgenerate
    
endmodule