struct Edge {
    let destination: Int
    let weight: Int
}

struct Graph {
    let numberOfVertices: Int
    var adjacencyList: [[Edge]] = []

    init(numberOfVertices: Int) {
        self.numberOfVertices = numberOfVertices
        self.adjacencyList = Array(repeating: [], count: numberOfVertices)
    }

    mutating func addEdge(source: Int, destination: Int, weight: Int) {
        adjacencyList[source].append(Edge(destination: destination, weight: weight))
    }
}

func dijkstra(graph: Graph, source: Int) -> [Int] {
    var distances = Array(repeating: Int.max, count: graph.numberOfVertices)
    var priorityQueue = [(vertex: Int, distance: Int)]()
    distances[source] = 0
    priorityQueue.append((source, 0))

    while !priorityQueue.isEmpty {
        priorityQueue.sort { $0.distance < $1.distance }
        let current = priorityQueue.removeFirst()

        for edge in graph.adjacencyList[current.vertex] {
            let newDistance = current.distance + edge.weight
            if newDistance < distances[edge.destination] {
                distances[edge.destination] = newDistance
                priorityQueue.append((edge.destination, newDistance))
            }
        }
    }
    
    return distances
}

var graph = Graph(numberOfVertices: 5)

graph.addEdge(source: 0, destination: 1, weight: 6)
graph.addEdge(source: 0, destination: 3, weight: 1)
graph.addEdge(source: 1, destination: 0, weight: 6)
graph.addEdge(source: 1, destination: 3, weight: 2)
graph.addEdge(source: 1, destination: 2, weight: 5)
graph.addEdge(source: 1, destination: 4, weight: 2)
graph.addEdge(source: 2, destination: 1, weight: 5)
graph.addEdge(source: 2, destination: 4, weight: 5)
graph.addEdge(source: 3, destination: 0, weight: 1)
graph.addEdge(source: 3, destination: 1, weight: 2)
graph.addEdge(source: 3, destination: 4, weight: 1)
graph.addEdge(source: 4, destination: 1, weight: 2)
graph.addEdge(source: 4, destination: 2, weight: 5)
graph.addEdge(source: 4, destination: 3, weight: 1)

let distances = dijkstra(graph: graph, source: 0)

for (vertex, distance) in distances.enumerated() {
    print("Shortest distance from 0 to \(vertex) is \(distance)")
}
