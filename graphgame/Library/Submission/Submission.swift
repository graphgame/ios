final class Submission: Identifiable {
	let level: Level
	let frozenNodes: Set<Node>
	
	var id: Int16 { level.id }
	
	init(level: Level, frozenNodes: Set<Node>) {
		self.level = level
		self.frozenNodes = frozenNodes
	}
}
