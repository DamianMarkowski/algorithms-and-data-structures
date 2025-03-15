class Node {
    let value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
    }
}

func visitAllNodes(_ node: Node?) {
    guard let node else { return }
    print(node.value)
    visitAllNodes(node.left)
    visitAllNodes(node.right)
}

class Stack {
    private var array: [Node] = []
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    func push(_ value: Node) {
        array.append(value)
    }
    
    func pop() -> Node? {
        array.removeLast()
    }
}

func visitAllNodes2(_ node: Node?) {
    guard let node else { return }
    
    let stack = Stack()
    stack.push(node)
    
    while !stack.isEmpty {
        guard let currentNode = stack.pop() else { continue }
        print(currentNode.value)
        
        if let left = currentNode.right {
            stack.push(left)
        }
        
        if let right = currentNode.right {
            stack.push(right)
        }
    }
}
