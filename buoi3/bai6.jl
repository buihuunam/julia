#queue_julia.jl
mutable struct Queue
    elements::Vector{Any}

    function Queue()
        new(Any[])
    end
end

function enqueue!(queue::Queue, element)
    push!(queue.elements, element)
    println("Enqueue $element")
end

function dequeue!(queue::Queue)
    if !is_empty(queue)
        element = popfirst!(queue.elements)
        println("Dequeue $element")
        return element
    else
        println("Queue is empty")
        return nothing
    end
end

function is_empty(queue::Queue)
    return isempty(queue.elements)
end

function size(queue::Queue)
    return length(queue.elements)
end

function display_all(queue::Queue)
    println("Queue: ", queue.elements)
end

# simulate
function main()
    queue = Queue()
    enqueue!(queue, 1)
    enqueue!(queue, 2)
    enqueue!(queue, 3)
    display_all(queue)

    front_item = dequeue!(queue)
    println("empty queue: ", is_empty(queue))

    while !is_empty(queue)
        dequeue!(queue)
    end

    println("empty queue: ", is_empty(queue))
end

main()