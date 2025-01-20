function bfs(graph, start)
    queue = [start]
    visited = Set{Char}()

    while !isempty(queue)
        vertex = popfirst!(queue)
        if vertex ∉ visited
            println("Visit $vertex")
            push!(visited, vertex)
            for neighbor in graph[vertex]
                if neighbor ∉ visited
                    push!(queue, neighbor)
                end
            end
            println("Add '$vertex' to visited set: ", graph[vertex])
            println()
        end
    end
end

# simulate graph
graph = Dict(
    'A' => Set(['B', 'C']),
    'B' => Set(['A', 'D', 'E']),
    'C' => Set(['A', 'F']),
    'D' => Set(['B']),
    'E' => Set(['B', 'F']),
    'F' => Set(['C', 'E'])
)

println("BFS traversal starting from vertex 'A':")
bfs(graph, 'A')