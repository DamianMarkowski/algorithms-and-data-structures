class Node<T> {
  let value: T
  var next: Node?
  
  init(value: T) {
    self.value = value
  }
}

class LinkedList<T> {

    private var head: Node<T>?

    var isEmpty: Bool {
        head == nil
    }

    var first: Node<T>? {
        head
    }

    func append(value: T) {
        let newNode = Node(value: value)
        if let lastNode = last() {
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }

    private func last() -> Node<T>? {
        var currentNode = head
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        return currentNode
    }

    func remove(value: T) where T: Equatable {
        var currentNode = head
        var previousNode: Node<T>?

        while currentNode != nil {
            if currentNode?.value == value {
                if previousNode == nil {
                    head = currentNode?.next
                } else {
                    previousNode?.next = currentNode?.next
                }
                return
            }
            previousNode = currentNode
            currentNode = currentNode?.next
        }
    }

    func printValues() {
        var currentNode = head
        while currentNode != nil {
            print(currentNode!.value, terminator: " -> ")
            currentNode = currentNode?.next
        }
        print("nil")
    }
    
}

let list = LinkedList<Int>()
list.append(value: 1)
list.append(value: 2)
list.append(value: 3)
list.append(value: 4)
list.append(value: 5)
list.printValues()
list.remove(value: 2)
list.remove(value: 4)
list.printValues()
print(list.first?.value as Any)
list.remove(value: 1)
list.remove(value: 3)
list.remove(value: 5)
print(list.isEmpty)
