module PGLogic (
    input [4:0] G,
    input [4:0] P,
    output [4:0] C
);

    assign C[0] = G[0];

    grey ginst1(
        .gleft(C[0]), .gtop(G[1]), .ptop(P[1]),
        .g(C[1])
    );

    wire [1:0] wire2;

    black binst1(
        .gleft(G[1]), .pleft(P[1]), .gtop(G[2]), .ptop(P[2]),
        .g(wire2[1]), .p(wire2[0])
    );

    grey ginst2(
        .gleft(C[0]), .gtop(wire2[1]), .ptop(wire2[0]),
        .g(C[2])
    );


    wire [1:0] wire3;

    black binst2(
        .gleft(G[2]), .pleft(P[2]), .gtop(G[3]), .ptop(P[3]),
        .g(wire3[1]), .p(wire3[0])
    );

    grey ginst3(
        .gleft(C[1]), .gtop(wire3[1]), .ptop(wire3[0]),
        .g(C[3])
    );

    wire [1:0] wire41, wire42;

    black binst3(
        .gleft(G[3]), .pleft(P[3]), .gtop(G[4]), .ptop(P[4]),
        .g(wire41[1]), .p(wire41[0])
    );   

    black binst4(
        .gleft(wire2[1]), .pleft(wire2[0]), .gtop(wire41[1]), .ptop(wire41[0]),
        .g(wire42[1]), .p(wire42[0])
    );

    grey ginst4(
        .gleft(C[0]), .gtop(wire42[1]), .ptop(wire42[0]),
        .g(C[4])
    );
    
endmodule