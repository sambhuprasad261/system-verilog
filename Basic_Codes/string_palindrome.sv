module tb;
  
  string str;
  int len;
  int is_palindrome;
  
  function int check_palindrome(input string str, input int n);
    
    for(int j = 0; j < n; j++)begin
      
      if(str[j] != str[n - 1 - j])
        return 0;
      
      end
    
    return 1;
    endfunction
    
  
  initial begin
    
    str = "Sas";
    
    $display("str = %s", str[0]);
   
    
    len = str.len();
    
    is_palindrome = check_palindrome(str, len);
    
    if (!is_palindrome)
      $display("The input %s is not palindrome", str);
    
    else
      $display("The input %s is palindrome", str);
    
  end
  
  
endmodule