module KSA (
    input [3:0] A, B,
    input Cin,
    output [4:0] S
    //output [3:0] S,
    //output Cout
);

    wire [4:0] G, P;

    assign G[0] = Cin;
    assign P[0] = 0;

    genvar i, j;
    generate
        for (i = 1; i < 5 ; i = i + 1) begin
                GP gp_inst (
                    .A(A[i-1]), .B(B[i-1]),
                    .G(G[i]), .P(P[i])
                );
        end
    endgenerate

    wire [4:0] C;

    PGLogic pglogic_inst (
        .G(G),
        .P(P),
        .C(C)
    );


    generate
        for (j = 0; j < 4; j = j + 1) begin
            xor(S[j], C[j], P[j+1]);
        end
    endgenerate

    assign S[4] = C[4];
    //assign Cout = C[4]; // (P[4] & C[3]) | G[4];


endmodule