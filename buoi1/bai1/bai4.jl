function merge!(arr, left, mid, right)
    n1 = mid - left + 1
    n2 = right - mid
    L = arr[left:left + n1 - 1]
    R = arr[mid + 1:mid + n2]
    i = j = 1
    k = left
    while i <= n1 && j <= n2
        if L[i] <= R[j]
            arr[k] = L[i]
            i += 1
        else
            arr[k] = R[j]
            j += 1
        end
        k += 1
    end
    while i <= n1
        arr[k] = L[i]
        i += 1
        k += 1
    end
    while j <= n2
        arr[k] = R[j]
        j += 1
        k += 1
    end
end

function merge_sort!(arr, left, right)
    if left < right
        mid = left + (right - left) ÷ 2
        merge_sort!(arr, left, mid)
        merge_sort!(arr, mid + 1, right)
        merge!(arr, left, mid, right)
    end
end

arr = [12, 11, 13, 5, 6, 7]
merge_sort!(arr, 1, length(arr))
println(arr)