module jandgate(input a, input b, output y);
  assign y = a & b;
endmodule

module test_jandgate;
  reg a;
  reg b;
  wire y;
  
  jandgate jand(.a(a), .b(b), .y(y));

  initial begin
    $display("RESULT\ta\tb\ty");

    a = 0; b = 0; #100; 
    if ( y == 0 ) 
      $display("PASS\t%d\t%d\t%d", a, b, y);
    else
      $display("FAIL\t%d\t%d\t%d", a, b, y);

    a = 0; b = 1; #100; 
    if ( y == 0 ) 
      $display("PASS\t%d\t%d\t%d", a, b, y);
    else
      $display("FAIL\t%d\t%d\t%d", a, b, y);

    a = 1; b = 0; #100; 
    if ( y == 0 ) 
      $display("PASS\t%d\t%d\t%d", a, b, y);
    else
      $display("FAIL\t%d\t%d\t%d", a, b, y);

    a = 1; b = 1; #100; 
    if ( y == 1 ) 
      $display("PASS\t%d\t%d\t%d", a, b, y);
    else
      $display("FAIL\t%d\t%d\t%d", a, b, y);   
  end

  initial begin 
    $dumpfile("dump.vcd"); 
    $dumpvars(0, test_jandgate);
  end
endmodule
