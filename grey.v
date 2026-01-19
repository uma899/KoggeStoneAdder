module grey (
    input gleft, gtop, ptop,
    output g
);
    assign g = (ptop & gleft) | gtop;
    
endmodule