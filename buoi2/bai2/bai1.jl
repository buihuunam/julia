function bubble_sort!(arr)
    n = length(arr)
    for i in 1:(n-1)
        swapped = false
        for j in 1:(n-i)
            if arr[j] > arr[j+1]
                arr[j], arr[j+1] = arr[j+1], arr[j]
                swapped = true
            end
        end
        if !swapped
            break
        end
    end
    return arr
end

# Test
arr = [64, 34, 25, 12, 22, 11, 90]
bubble_sort!(arr)
println("Sorted array is: ", arr)