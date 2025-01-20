mutable struct RequestQueue
    queue::Vector{String}

    function RequestQueue()
        new(String[])
    end
end

function add_request!(rq::RequestQueue, request::String)
    push!(rq.queue, request)
    println("Add request $request")
end

function process_request!(rq::RequestQueue)
    if !isempty(rq.queue)
        request = popfirst!(rq.queue)
        println("Process request $request")
        return request
    else
        println("Queue is empty")
        return nothing
    end
end

function display_queue(rq::RequestQueue)
    println("Queue: ", rq.queue)
end

# simulate
function main()
    request_queue = RequestQueue()
    add_request!(request_queue, "Request 1")
    add_request!(request_queue, "Request 2")
    add_request!(request_queue, "Request 3")
    display_queue(request_queue)

    process_request!(request_queue)
    display_queue(request_queue)

    process_request!(request_queue)
    display_queue(request_queue)

    process_request!(request_queue)
    display_queue(request_queue)
end

main()