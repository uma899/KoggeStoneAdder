module KSA #(parameter N = 4) (
    input [N-1:0] A, B,
    input Cin,
    output [N:0] S
    //output [3:0] S,
    //output Cout
);

    wire [N:0] G, P;

    assign G[0] = Cin;
    assign P[0] = 0;

    genvar i, j;
    generate
        for (i = 1; i < N + 1 ; i = i + 1) begin
                GP gp_inst (
                    .A(A[i-1]), .B(B[i-1]),
                    .G(G[i]), .P(P[i])
                );
        end
    endgenerate

    wire [N:0] C;

    PGLogic #(.N(N)) pglogic_inst  (
        .G(G),
        .P(P),
        .C(C)
    );


    generate
        for (j = 0; j < N; j = j + 1) begin
            xor(S[j], C[j], P[j+1]);
        end
    endgenerate

    assign S[N] = C[N];
    //assign Cout = C[4]; // (P[4] & C[3]) | G[4];


endmodule