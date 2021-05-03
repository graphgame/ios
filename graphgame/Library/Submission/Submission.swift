final class Submission: Identifiable {
	var id: Int16 { level.id }
	
	let level: Level
	let frozenNodes: Set<Node>
	
	private(set) lazy var stars = {
		Bool.random()
			? Int16.random(in: 0...3)
			: nil
	}()
	
	init(level: Level, frozenNodes: Set<Node>) {
		self.level = level
		self.frozenNodes = frozenNodes
	}
}
