class Node<T> {
    var value: T
    var next: Node?
    weak var previous: Node?
    
    init(value: T) {
        self.value = value
    }
}

class Deque<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        head == nil
    }
    
    func enqueueFirst(_ value: T) {
        let newNode = Node(value: value)
        if let head {
            head.previous = newNode
            newNode.next = head
        } else {
            tail = newNode
        }
        head = newNode
    }
    
    func enqueueLast(_ value: T) {
        let newNode = Node(value: value)
        if let tail {
            tail.next = newNode
            newNode.previous = tail
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    func dequeueFirst() -> T? {
        guard head != nil else { return nil }
        let value = head?.value
        head = head?.next
        head?.previous = nil
        return value
    }
    
    func dequeueLast() -> T? {
        guard tail != nil else { return nil }
        let value = tail?.value
        tail = tail?.previous
        tail?.next = nil
        return value
    }
}
