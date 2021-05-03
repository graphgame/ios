final class Level: Identifiable {
	let id: Int16
	
	private let graphBuilder: () -> Graph
	lazy var graph = graphBuilder()
	
	init(_ id: Int16, @Graph.Builder graph: @escaping () -> Graph) {
		self.id = id
		graphBuilder = graph
	}
}
