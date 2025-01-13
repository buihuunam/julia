function insertion_sort(arr)
    n = length(arr)
    for i in 2:n
        key = arr[i]
        j = i - 1
        while j > 0 && arr[j] > key
            arr[j + 1] = arr[j]
            j -= 1
        end
        arr[j + 1] = key
    end
    return arr
end

# Test
arr = [5, 2, 4, 6, 1, 3]
insertion_sort(arr)
println("Sorted array: ", arr)