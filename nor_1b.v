module nor_1b(x, y, o);
  
  output o;
  input x;
  input y;
  
  assign o = !(x | y);
  
endmodule
