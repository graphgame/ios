import CoreGraphics

final class Graph {
	static let size = CGSize(width: 100, height: 100)
	
	let nodes: [Node]
	let edges: [Edge]
	
	init(with components: [GraphComponent]) {
		var nodes = [String: Node]()
		var edges = Set<Edge>()
		
		for component in components {
			if let node = component as? Node {
				nodes[node.id] = node
			} else if let edge = component as? Edge.Raw {
				guard let from = nodes[edge.from] else {
					fatalError("Node \"\(edge.from)\" does not exist")
				}
				
				guard let to = nodes[edge.to] else {
					fatalError("Node \"\(edge.to)\" does not exist")
				}
				
				let edge = Edge(from: from, to: to)
				
				if edges.contains(edge) {
					fatalError("Duplicate edge \"\(edge.from.id)\" --> \"\(edge.to.id)\"")
				}
				
				edges.insert(edge)
			} else {
				fatalError("Unknown graph component")
			}
		}
		
		self.nodes = .init(nodes.values)
		self.edges = .init(edges)
	}
}
