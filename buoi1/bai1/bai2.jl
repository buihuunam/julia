function linear_search(arr::Vector{Int}, target::Int)
    for (index, value) in pairs(arr)
        if value == target
            return index - 1 # Trừ 1 để chỉ số khớp với C++ và Python
        end
    end
    return -1
end

arr = [4, 2, 5, 1, 3]
println(linear_search(arr, 5)) # Output: 2
