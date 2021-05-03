import CoreGraphics

final class Node: GraphComponent, Identifiable, Hashable {
	static let radius: CGFloat = 30
	
	let id: String
	let position: CGPoint
	
	var children = [Node]()
	
	init(id: String, position: CGPoint) {
		if
			position.x < 0 ||
			position.y < 0 ||
			position.x > Graph.size.width ||
			position.y > Graph.size.height
		{
			fatalError("Node out of bounds")
		}
		
		self.id = id
		self.position = position
	}
	
	static func == (a: Node, b: Node) -> Bool {
		a.id == b.id
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}

infix operator --

func -- (id: String, position: (x: CGFloat, y: CGFloat)) -> Node {
	.init(id: id, position: .init(x: position.x, y: position.y))
}
