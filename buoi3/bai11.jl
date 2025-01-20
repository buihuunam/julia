mutable struct Robot
    position::Vector{Int}
    direction::Char
    history::Vector{String}

    function Robot()
        new([0, 0], 'N', String[])
    end
end

function move_forward!(robot::Robot)
    if robot.direction == 'N'
        robot.position[2] += 1
    elseif robot.direction == 'E'
        robot.position[1] += 1
    elseif robot.direction == 'S'
        robot.position[2] -= 1
    elseif robot.direction == 'W'
        robot.position[1] -= 1
    end
    push!(robot.history, "forward")
    println("Moved forward to ", robot.position, ", facing ", robot.direction)
end

function move_backward!(robot::Robot)
    if robot.direction == 'N'
        robot.position[2] -= 1
    elseif robot.direction == 'E'
        robot.position[1] -= 1
    elseif robot.direction == 'S'
        robot.position[2] += 1
    elseif robot.direction == 'W'
        robot.position[1] += 1
    end
    push!(robot.history, "backward")
    println("Moved backward to ", robot.position, ", facing ", robot.direction)
end

function turn_left!(robot::Robot)
    dirs = ['N', 'E', 'S', 'W']
    idx = findfirst(==(robot.direction), dirs)
    robot.direction = dirs[mod(idx, 4) + 1]
    push!(robot.history, "left")
    println("Turned left to face ", robot.direction, ", at ", robot.position)
end

function turn_right!(robot::Robot)
    dirs = ['N', 'E', 'S', 'W']
    idx = findfirst(==(robot.direction), dirs)
    robot.direction = dirs[mod(idx, 4) + 1]
    push!(robot.history, "right")
    println("Turned right to face ", robot.direction, ", at ", robot.position)
end

function undo!(robot::Robot)
    if isempty(robot.history)
        println("No command to undo")
        return
    end
    last_command = pop!(robot.history)
    println("Undoing ", last_command)
    if last_command == "forward"
        move_backward!(robot)
    elseif last_command == "backward"
        move_forward!(robot)
    elseif last_command == "left"
        turn_right!(robot)
    elseif last_command == "right"
        turn_left!(robot)
    end
end

function display_status(robot::Robot)
    println("Robot is at ", robot.position, ", facing ", robot.direction)
end

# simulate
robot = Robot()
move_forward!(robot)
turn_right!(robot)
move_forward!(robot)
turn_left!(robot)
move_backward!(robot)
display_status(robot)

println("\nUndoing last command")
undo!(robot)
undo!(robot)
display_status(robot)