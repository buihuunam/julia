#stack_julia_deque.jl
import Base: push!, pop!, isempty, last #import push!, pop!, isempty, last from Base module
using DataStructures

struct Stack
    elements::Deque{Any}
    Stack() = new(Deque{Any}())
end

function push!(s::Stack, item)
    push!(s.elements, item)
    println("Pushed '$item' to the stack")
end

function pop!(s::Stack)
    if !isempty(s.elements)
        item = pop!(s.elements)
        println("Popped '$item' from the stack")
        return item
    else
        println("Stack is empty")
        return nothing
    end
end

function peek(s::Stack)
    if !isempty(s.elements)
        return last(s.elements)
    else
        println("Stack is empty")
        return nothing
    end
end

function is_empty(s::Stack)
    return isempty(s.elements)
end

function display(s::Stack)
    println("Stack: ", s.elements)
end

function main()
    s = Stack()
    push!(s, 1)
    push!(s, 2)
    push!(s, 3)
    display(s)

    top_item = peek(s)
    println("Top item: $top_item")
    pop!(s)
    display(s)

    while !is_empty(s)
        pop!(s)
    end
    display(s)
end

main()