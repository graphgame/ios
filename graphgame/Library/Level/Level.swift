final class Level: Identifiable {
	let id: Int16
	let graph: Graph
	
	init(_ id: Int16, @Graph.Builder graph: () -> Graph) {
		self.id = id
		self.graph = graph()
	}
}
