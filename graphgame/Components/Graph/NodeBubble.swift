import SwiftUI

struct NodeBubble: View {
	private let node: Node
	
	@Binding private var frozen: Bool
	
	init(node: Node, frozen: Binding<Bool>) {
		self.node = node
		_frozen = frozen
	}
	
	private func toggle() {
		frozen = !frozen
	}
	
	var body: some View {
		Button(action: toggle) {
			ZStack {
				Circle()
					.stroke(Color(frozen ? "Blue" : "Border"))
					.background(Circle().fill(frozen ? Color("Blue") : Color.white))
					.frame(width: Node.radius * 2, height: Node.radius * 2)
				Text(node.id)
					.bold()
					.foregroundColor(frozen ? .white : .black)
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
