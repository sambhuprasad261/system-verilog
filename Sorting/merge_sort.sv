module tb;
	
	int arr[];
	int arr_len;

	function automatic void merge(ref int arr[], int left, int mid, int right);
	
		int i, j, k;
		int n1 = mid - left + 1;
		int n2 = right - mid;
		int l1[n1], r1[n2];
		
		for(i = 0; i < n1; i++)begin
				
			l1[i] = arr[i + l];
			
		end 
		
		for(j = 0; j < n2; j++)begin
			
			r1[j] = arr[mid + 1 + j];
			
		end
		
		i = 0;
		j = 0;
		k = l;
		
		while(i < n1 && j < n2)begin
		
			if(l1[i] <= r1[j])begin
				
				arr[k] = l1[i];
				i++;
				
			end
			
			else begin 
				
				arr[k] = r1[j];
				j++;
				
			end 
			
			k++;
		
		end
		
		while(i < n1)begin
		
			arr[k] = l1[i];
			i++;
			k++;
		
		end
		
		while(j < n2)begin
		
			arr[k] = r1[j];
			j++;
			k++;
		
		end 
	
	endfunction
	
	function automatic void merge_sort(ref int arr[], int left, int right);
	
		if(left < right)begin
		
			int mid = left + (right - left) / 2;

			merge_sort(arr, left, mid);
			merge_sort(arr, mid + 1, right);
			
			merge(arr, left, mid, right);
		
		end
	
	endfunction

	initial begin
	
		arr = new[7];
		arr_len = arr.size();
		
		for(int i = 0; i < arr_len; i++)begin
		
			arr[i] = $urandom_range(1, 95);
		
		end
		
		$write("The Unsorted Array is: %p\n", arr);
		
		merge_sort(arr, 0, arr_len - 1);
		
		$write("The Sorted Array is: %p\n", arr);
	
	end

endmodule