import CoreGraphics

final class Node: GraphComponent, Identifiable {
	let id: String
	let position: CGPoint
	
	var children = [Node]()
	
	init(id: String, position: CGPoint) {
		self.id = id
		self.position = position
	}
}

infix operator --

func -- (id: String, position: (x: CGFloat, y: CGFloat)) -> Node {
	.init(id: id, position: .init(x: position.x, y: position.y))
}
