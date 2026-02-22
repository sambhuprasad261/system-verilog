module tb;
  
  int arr [];
  int i;
  int len;
  
  initial begin
    
    arr = new[15];
    i = 0;
    arr = '{0, 1, 7, 0, 2, 0, 0, 10, 0, 0, 0, 4, 0, 5, 8};
    len = arr.size();
    
    for(int j = 0; j < len; j++) begin
      
      if(arr[j] != 0) begin
        
        arr[i] = arr[j];
        i++;
        
      end
      
    end
    
    for(int k = i; k < len; k++) begin
      
      arr[k] = 0;
      
    end
    
    $display("arr = %p", arr);
    
  end
  
endmodule