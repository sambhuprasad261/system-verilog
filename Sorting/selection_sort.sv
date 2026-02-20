module tb;

	int arr [];
	int arr_len;

	function automatic void selection_sort(ref int arr[], int n);
		
		int i, j, key;
		
		for(i = 0; i < n - 1; i++)begin
			 
			key = i;
			
			for(j = i + 1; j < n; j++)begin
			
				if(arr[j] < arr[key]) begin
				
					key = j;
				
				end
			
			end
			
			int temp = arr[i];
			arr[i] = arr[key];
			arr[key] = temp;
		
		end
	
	endfunction
	
	initial begin
	
		arr = new[5];
		arr_len = arr.size();
		arr = '{15, 7, 28, 14, 3};
		
		$write("The Unsorted array is: %p", arr);
		$display();
		
		selection_sort(arr, arr_len);
		
		$write("The Unsorted array is: %p", arr);
	
	end

endmodule