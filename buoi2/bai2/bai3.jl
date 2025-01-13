function selection_sort(arr)
    n = length(arr)
    for i in 1:n
        #find a minimum element in the rest of the array
        min_idx = i
        for j in i+1:n
            if arr[j] < arr[min_idx]
                min_idx = j
            end
        end
        #swap the minimum element with the current element
        if min_idx != i
            arr[i], arr[min_idx] = arr[min_idx], arr[i]
        end
    end
    return arr
end

# Test
arr = [5, 2, 4, 6, 1, 3]
selection_sort(arr)
println("Sorted array: ", arr)