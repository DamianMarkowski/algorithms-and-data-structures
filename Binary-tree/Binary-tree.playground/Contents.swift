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

class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedListQueue<T> {
    private var head: LinkedListNode<T>?
    private var tail: LinkedListNode<T>?

    var isEmpty: Bool {
       head == nil
    }

    private(set) var count = 0

    func enqueue(_ element: T) {
        count += 1
        let newNode = LinkedListNode(value: element)
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }

    func dequeue() -> T? {
        guard let headNode = head else { return nil }
        count -= 1
        head = headNode.next
        if head == nil {
            tail = nil
        }
        return headNode.value
    }
}

func visitAllNodes3(_ node: Node) {
    let queue = LinkedListQueue<Node>()
    queue.enqueue(node)
    
    while !queue.isEmpty {
        for _ in 1...queue.count {
            let node = queue.dequeue()
            print(node?.value ?? "")
            if let left = node?.left {
                queue.enqueue(left)
            }
            if let right = node?.right {
                queue.enqueue(right)
            }
        }
    }
}
