import SwiftUI

private let size = Node.radius * 2

struct NodeBubble: View {
	private let node: Node
	
	@Binding
	private var frozen: Bool
	
	private var background: Color {
		if node.x { return Color("Green") }
		if node.y { return Color("Orange") }
		if frozen { return Color("Blue") }
		
		return .white
	}
	
	init(node: Node, frozen: Binding<Bool>) {
		self.node = node
		_frozen = frozen
	}
	
	private func toggle() {
		frozen = !frozen
	}
	
	private var content: some View {
		ZStack {
			Circle()
				.stroke(node.x || node.y || frozen ? background : Color("Border"))
				.background(Circle().fill(background))
				.frame(width: size, height: size)
			Text(node.id)
				.bold()
				.foregroundColor(node.x || node.y || frozen ? .white : .black)
		}
	}
	
	var body: some View {
		if node.x || node.y {
			content
		} else {
			Button(action: toggle) {
				content
			}
		}
	}
}

struct NodeBubble_Previews: PreviewProvider {
	static var previews: some View {
		NodeBubble(node: levels[0].graph.nodes[0], frozen: .constant(false))
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
