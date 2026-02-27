module tb;
  
  int num;
  int count;
  string s;
  int len;
  
  initial begin
    
    num = 50000000;
    s = "";
    count = 0;
    
    for(int i = 1; i < num + 1; i++)begin
      
      $swrite(s, "%0d", i);
      len = s.len();
      
      for (int j = 0; j < len; j++)begin
        
        if(s[j] == "1")begin
          
          count += 1;
          
        end
        
        else begin
          
          continue;
          
        end
        
      end
      
    end
    
    $display("The number of 1's in %0d is %0d", num, count);
    
  end
  
endmodule