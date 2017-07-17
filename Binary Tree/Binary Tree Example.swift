// Binary Tree Example
// Read the article here:
// https://medium.com/@mrlauriegray/swift-3-enums-and-binary-search-trees-104f5e8d47e9

enum BinaryTree<Element: Comparable> {
    case empty
    indirect case node(value: Element, left: BinaryTree<Element>, right: BinaryTree<Element>)
}


extension BinaryTree {
    func addNode(_ newValue:Element) -> BinaryTree<Element> {
        switch self {
        case .empty:
            return BinaryTree.node(value: newValue, left: .empty, right: .empty)
        case let .node(value, left, right):
            if newValue < value {
                return BinaryTree.node(value: value, left: left.addNode(newValue), right: right)
            } else {
                return BinaryTree.node(value: value, left: left, right: right.addNode(newValue))
            }
        }
    }
}

let tree = BinaryTree<Int>.empty.addNode(3)
