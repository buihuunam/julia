function dfs(graph, start)
    stack = [start]
    visited = Set{Char}()

    while !isempty(stack)
        vertex = pop!(stack)
        if vertex ∉ visited
            print(vertex, " ")
            push!(visited, vertex)

            # Add all neighbors of vertex to stack
            neighbors = reverse(graph[vertex])
            append!(stack, neighbors)
            println("đã đẩy các nút kề '", vertex, "' vào stack: ", neighbors)
        end
    end
end

graph = Dict(
    'A' => ['B', 'C'],
    'B' => ['D', 'E'],
    'C' => ['F'],
    'D' => Char[],
    'E' => ['F'],
    'F' => Char[]
)

println("DFS traversal starting from vertex 'A':")
dfs(graph, 'A')