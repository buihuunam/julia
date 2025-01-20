using Random
using Base.Threads: @spawn, sleep

mutable struct Sensor
    id::Int
    print_queue::Channel{String}

    function Sensor(id, print_queue)
        new(id, print_queue)
    end

    function send_data(sensor::Sensor)
        while true
            data = "Data from sensor $(sensor.id): $(rand(1:100))"
            put!(sensor.print_queue, data)
            sleep(rand(0.5:0.1:2.0))  # send a random data every 0.5 to 2 seconds
        end
    end
end

mutable struct PrintQueue
    queue::Channel{String}

    function PrintQueue()
        new(Channel{String}(Inf))
    end

    function print_data(print_queue::PrintQueue)
        while true
            data = take!(print_queue.queue)
            println(data)
            sleep(0.1)  # check the queue every 0.1 seconds
        end
    end
end

function main()
    print_queue = PrintQueue()

    sensors = [Sensor(i, print_queue.queue) for i in 1:5]

    for sensor in sensors
        @spawn Sensor.send_data(sensor)
    end

    @spawn PrintQueue.print_data(print_queue)

    # Keep the main function alive to allow threads to run
    while true
        sleep(1)
    end
end

main()