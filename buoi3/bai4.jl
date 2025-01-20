function decimal_to_binary(n)
    stack = Int[]
    println("convert $n to binary")

    if n == 0
        push!(stack, 0)
        println("pushed 0 to stack")
    else
        while n > 0
            remainder = n % 2
            push!(stack, remainder)
            println("pushed $remainder to stack")
            n = n ÷ 2
            println("n = $n")
        end
    end

    binary = ""
    println("pop all elements from stack")
    while !isempty(stack)
        binary *= string(pop!(stack))
        println("popped $(last(binary)) from stack")
    end
    return binary
end

# simulate
number = 10
binary = decimal_to_binary(number)
println("Binary representation of $number is: $binary")