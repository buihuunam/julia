using Base.Iterators: product

function get_neighbors(grid, position)
    x, y = position
    neighbors = []
    directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]  # up, down, left, right

    for (dx, dy) in directions
        new_x, new_y = x + dx, y + dy
        if 0 <= new_x < size(grid, 1) && 0 <= new_y < size(grid, 2)
            if grid[new_x, new_y] == 'O'
                push!(neighbors, (new_x, new_y))
            end
        end
    end
    return neighbors
end

function dfs(grid, start, goal)
    stack = [start]
    visited = Set{Tuple{Int, Int}}()
    parent = Dict{Tuple{Int, Int}, Tuple{Int, Int}}()

    while !isempty(stack)
        current = pop!(stack)

        if current == goal
            break
        end

        if current in visited
            continue
        end

        push!(visited, current)

        neighbors = get_neighbors(grid, current)
        for neighbor in neighbors
            if neighbor ∉ visited
                push!(stack, neighbor)
                parent[neighbor] = current
            end
        end
    end

    if goal ∉ parent && start != goal
        println("No path found")
        return nothing
    end

    path = []
    current = goal
    while current != start
        push!(path, current)
        current = get(parent, current, start)
    end
    push!(path, start)
    reverse!(path)
    return path
end

# simulate grid
grid = [
    'O' 'O' 'O' 'O' 'O';
    '1' '1' 'O' '1' 'O';
    'O' 'O' 'O' '1' 'O';
    'O' '1' '1' '1' 'O';
    'O' 'O' 'O' 'O' 'O'
]

start = (0, 0)
goal = (4, 4)
path = dfs(grid, start, goal)
if path !== nothing
    println("Path found: ")
    println(path)
end