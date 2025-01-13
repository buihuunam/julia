function sum_1_to_n(n::Int)
    s = 0 # 1 phép gán
    for i in 1:n # n lần lặp
        s += i # 1 phép cộng và 1 phép gán mỗi lần lặp
    end
    return s
end

n = 5
println("Tong 1..n = ", sum_1_to_n(n)) # Output: 15
