import CoreGraphics

final class Graph {
	static let size = CGSize(width: 100, height: 100)
	
	let nodes: [Node]
	let edges: [Edge]
	
	private let ids: [String: Node]
	
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
				
				if !edges.insert(edge).inserted {
					fatalError("Duplicate edge \"\(edge.from.id)\" --> \"\(edge.to.id)\"")
				}
			} else {
				fatalError("Unknown graph component")
			}
		}
		
		if nodes[Node.x] == nil {
			fatalError("Missing starting node")
		}
		
		if nodes[Node.y] == nil {
			fatalError("Missing ending node")
		}
		
		self.nodes = .init(nodes.values)
		self.edges = .init(edges)
		
		self.ids = nodes
	}
	
	subscript(_ id: String) -> Node? {
		ids[id]
	}
}
