using Base.Threads: @spawn, sleep
using Base.Threads: Channel, put!, take!, isready

mutable struct CommandQueue
    queue::Channel{String}

    function CommandQueue()
        new(Channel{String}(Inf))
    end
end

function enqueue(queue::CommandQueue, command::String)
    put!(queue.queue, command)
    println("Enqueued command: $command")
end

function dequeue(queue::CommandQueue)
    if isready(queue.queue)
        return take!(queue.queue)
    else
        return ""
    end
end

function is_empty(queue::CommandQueue)
    return !isready(queue.queue)
end

mutable struct RobotController
    command_queue::CommandQueue

    function RobotController(queue::CommandQueue)
        new(queue)
    end
end

function process_commands(controller::RobotController)
    while true
        if !is_empty(controller.command_queue)
            command = dequeue(controller.command_queue)
            if command == "stop"
                println("Stopping robot")
                break
            end
            println("Processing command: $command")
        end
        sleep(0.1)
    end
end

function main_simulation()
    command_queue = CommandQueue()
    controller = RobotController(command_queue)

    # Add some commands to the queue
    commands = ["forward", "backward", "left", "right", "stop"]
    for command in commands
        enqueue(command_queue, command)
        sleep(0.5)  # wait for half a second
    end

    # Start processing commands in a separate thread
    @spawn process_commands(controller)

    # Keep the main thread alive
    sleep(15)
end

main_simulation()