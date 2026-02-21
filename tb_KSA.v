`timescale 1ns / 1ps

module tb_KSA;

    parameter size = 64;
    parameter num_tests = 10000; // Number of random trials

    reg [size - 1 : 0] A;
    reg [size - 1 : 0] B;
    reg Cin;

    wire [size:0] S;

    reg [size:0] expected;
    integer i;
    integer total_errors = 0;

    KSA #(.N(size)) uut (
        .A(A), 
        .B(B), 
        .Cin(Cin), 
        .S(S)
    );

    task check_result;
        begin
            expected = A + B + Cin;
            #1; // Small delay 
            if (S !== expected) begin
                $display("[ERROR] A:%h B:%h Cin:%b | Got:%h | Exp:%h", A, B, Cin, S, expected);
                total_errors = total_errors + 1;
            end
        end
    endtask

    initial begin

        $display("STARTING RANDOMIZED TEST FOR %0d-BIT KSA", size);
        $display("====================================");
        
        // some corner cases
        $display("Running Corner Cases...");
        
        A = 0; B = 0; Cin = 0; #10; check_result();
        
        A = {size{1'b1}}; B = 0; Cin = 1; #10; check_result();
        A = {size{1'b1}}; B = {size{1'b1}}; Cin = 1; #10; check_result();
        
        // Test Alternating Bits (Crosstalk/Short check)
        A = {size/2{2'b10}}; B = {size/2{2'b01}}; Cin = 0; #10; check_result();

        // 2. RANDOMIZED TESTING
        $display("Running %0d Random Trials...", num_tests);
        for (i = 0; i < num_tests; i = i + 1) begin
            A = $urandom;     
            B = $urandom; 
            Cin = $urandom % 2;
            
            #10;
            check_result();
            
            // Printing progress for every 1000 tests
            if (i % 1000 == 0 && i > 0) 
                $display("...completed %0d tests", i);
        end

        // FINAL REPORT
        $display("====================================");
        $display("FINAL REPORT:");
        $display("Tests Run: %0d", num_tests + 4);
        if (total_errors == 0) begin
            $display("RESULT: SUCCESS! No errors found.");
        end else begin
            $display("RESULT: FAILURE. Found %0d errors.", total_errors);
        end
        $display("====================================");
        
        $finish;
    end

endmodule