import Foundation

class Node {
    var next: Node?
    var value: String
    
    init(value: String) {
        self.value = value
    }
}

let node1 = Node(value: "node1")
let node2 = Node(value: "node2")
node1.next = node2
let node3 = Node(value: "node3")
node2.next = node3
node3.next = nil

func parseNodes(from node: Node?) {
    guard let validNode = node else {
        return
    }
    print(validNode.value)
    parseNodes(from: validNode.next)
}

parseNodes(from: node1)
