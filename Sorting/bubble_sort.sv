module tb;
	
	int arr [];
	int arr_len;
	
	function automatic void bubble_sort(ref int arr [], int n);
	
		for(int i = 0; i < n - 1; i++)begin
		
			for(int j = 0; j < n - i - 1; j++)begin
			
				if(arr[j + 1] < arr[j])begin
				
					int temp = arr[j];
					arr[j] = arr[j + 1];
					arr[j + 1] = temp;
				
				end
			
			end
		
		end
	
	endfunction

	initial begin
	
		arr = new[5];
		arr = '{5, 4, 3, 2, 1};
		
		$write("The Unsorted array is: %p", arr);
		
		arr_len = arr.size();
		
		bubble_sort(arr, arr_len);
		
		$display();
		
		$write("The Sorted array is: %p", arr);
	
	end
	


endmodule