final class Level: Identifiable, Equatable, Hashable {
	let id: Int16
	
	private let graphBuilder: () -> Graph
	private(set) lazy var graph = graphBuilder()
	
	private(set) lazy var next: Level? = {
		guard let index = levels.firstIndex(of: self) else {
			return nil
		}
		
		return index + 1 < levels.count
			? levels[index + 1]
			: nil
	}()
	
	init(_ id: Int16, @Graph.Builder graph: @escaping () -> Graph) {
		self.id = id
		graphBuilder = graph
	}
	
	static func == (a: Level, b: Level) -> Bool {
		a.id == b.id
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}
