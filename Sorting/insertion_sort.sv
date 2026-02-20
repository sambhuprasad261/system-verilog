module tb;
  
  int n;
  int arr [];
  
  function automatic void insertion_sort(ref int arr[], ref int n);
    
    int i, j, key;
    
    for(i = 1; i < n; i++)begin
      
      key = arr[i];
      j = i - 1;
      
      while(j >= 0 && arr[j] > key)begin
        
        arr[j + 1] = arr[j];
        j--;
        
      end
      
      arr[j + 1] = key;
      
    end
    
  endfunction
  
  initial begin
    
    arr = new[10];
    n = arr.size();
    
    for(int i = 0; i < n; i++)begin
      
      arr[i] = $urandom_range(1, 10);
      
    end
    
    $write("The Unsorted array is: ");
    
    foreach(arr[i])begin
      
      $write("%0d ", arr[i]);
      
    end
    $display();
    
    insertion_sort(arr, n);
    
    $write("The Sorted array is: ");
    
    foreach(arr[i]) begin
      
      $write("%0d ", arr[i]);
      
    end
    
  end
  
  
endmodule