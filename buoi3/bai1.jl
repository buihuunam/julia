import Base: push!, pop! #import push! and pop! from Base module

mutable struct Stack
    elements::vector{Any}
    Stack() = new(Vector{Any}())
end

function push!(s::Stack, x)
    push!(s.elements, x)
    println("Pushed '$x' to the stack")
end

function pop!(s::Stack)
    if !isempty(s.elements)
        item = pop!(s.elements)# use pop! from Base module
        println("Popped '$item' from the stack")
        return item
    else
        println("Stack is empty")
        return nothing
    end
end

function is_emtpy(s::Stack)
    return isempty(s.elements)
end

function Base.display(s::Stack)
    println("Stack: ", reverse(s.elements))
end

function Main()
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
    if is_empty(s) == true
        println("Stack is empty")     
    end
end