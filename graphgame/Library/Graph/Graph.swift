final class Graph {
	let nodes: [Node]
	
	init(components: [GraphComponent]) {
		var nodes = [String: Node]()
		
		for component in components {
			if let node = component as? Node {
				nodes[node.id] = node
			} else if let edge = component as? Edge {
				guard let from = nodes[edge.from] else {
					fatalError("Node \"\(edge.from)\" does not exist")
				}
				
				guard let to = nodes[edge.to] else {
					fatalError("Node \"\(edge.to)\" does not exist")
				}
				
				from.children.append(to)
			} else {
				fatalError("Unknown graph component")
			}
		}
		
		self.nodes = .init(nodes.values)
	}
}
