function merge!(arr, l::Int, m::Int, r::Int)
    n1 = m - l + 1
    n2 = r - m
    L = Array{eltype(arr)}(undef, n1)
    R = Array{eltype(arr)}(undef, n2)

    for i in 1:n1
        L[i] = arr[l + i - 1]
    end

    for j in 1:n2
        R[j] = arr[m + j]
    end

    i,j = 1,1
    k = l
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


function merge_sort!(arr, l::Int, r::Int)
    if l < r
       m = div(l + r, 2)
       merge_sort!(arr, l, m)
       merge_sort!(arr, m + 1, r)
       merge!(arr, l, m, r)
    end
    return arr
end

# Test
using Random
Random.seed!(0)

arr = [5,2,9,1,5,6]
merge_sort!(arr, 1, length(arr))
println("Sorted array: ", arr)