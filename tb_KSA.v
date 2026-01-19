`timescale 1ns / 1ps

module tb_KSA;

    reg [3:0] A;
    reg [3:0] B;
    reg Cin;

    wire [4:0] S;

    reg [4:0] expected;
    integer i, j, k;
    integer total_errors = 0;
    integer unknown_errors = 0;

    KSA uut (
        .A(A), 
        .B(B), 
        .Cin(Cin), 
        .S(S)
    );

    initial begin
        $display("=================================================");
        $display("STARTING FINAL EXHAUSTIVE TEST (512 COMBINATIONS)");
        $display("=================================================");
        
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin
                    
                    A = i;
                    B = j;
                    Cin = k;
                    
                    #10; // Wait for combinational delay
                    
                    expected = A + B + Cin;
                    
                    // Use Case-Equality (===) to detect 'X' or 'Z'
                    if (S !== expected) begin
                        total_errors = total_errors + 1;
                    end
                        // Check if the failure is due to an 'X' (Floating wire)
                        if (^S === 1'bx) begin
                            $display("[FLOATING WIRE ERROR] A:%d B:%d Cin:%b | Got: %b (X) | Expected: %d", A, j, k, S, expected);
                            unknown_errors = unknown_errors + 1;
                        end else begin
                            $display(" A:%d B:%d Cin:%b | Got: %d | Expected: %d", A, j, k, S, expected);
                        end
                   
                end
            end
        end

        $display("=================================================");
        $display("FINAL REPORT:");
        $display("Total Combinations Tested: 512");
        $display("Total Failures:            %0d", total_errors);
        $display("Unknown (X) Failures:      %0d", unknown_errors);
        
        if (total_errors == 0)
            $display("RESULT: SUCCESS - Adder is perfect.");
        else if (unknown_errors > 0)
            $display("RESULT: - (X).");
        else
            $display("RESULT: - logic gates are incorrect.");
        $display("=================================================");
        
        $finish;
    end
      
endmodule