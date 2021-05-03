final class Edge: Hashable {
	let from: Node
	let to: Node
	
	init(from: Node, to: Node) {
		self.from = from
		self.to = to
	}
	
	static func == (a: Edge, b: Edge) -> Bool {
		a.from == b.from && a.to == b.to
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(from)
		hasher.combine(to)
	}
}
