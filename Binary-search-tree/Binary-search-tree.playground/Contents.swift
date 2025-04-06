class Node {
    let value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
    }
}

func checkIfValueExists(in root: Node?, value: Int) -> Bool {
    guard let root else { return false }
    
    if value == root.value {
        return true
    }
    
    if value < root.value {
        return checkIfValueExists(in: root.left, value: value)
    } else {
        return checkIfValueExists(in: root.right, value: value)
    }
}
