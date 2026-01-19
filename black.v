module black (
    input gleft, pleft, gtop, ptop,
    output g, p
);

    assign g = (ptop & gleft) | gtop;

    assign p = pleft & ptop;
    
endmodule