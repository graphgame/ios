import SwiftUI

struct GraphLayout: View {
	private let graph: Graph
	
	@State private var frozenNodes = Set<Node>()
	
	init(graph: Graph) {
		self.graph = graph
	}
	
	private func position(of node: Node, in geometry: GeometryProxy) -> CGPoint {
		let dimension = min(geometry.size.width, geometry.size.height)
		
		return .init(
			x: node.position.x * dimension / Graph.size.width,
			y: node.position.y * dimension / Graph.size.height
		)
	}
	
	var body: some View {
		GeometryReader { geometry in
			ForEach(graph.nodes) { node in
				NodeBubble(
					node: node,
					frozen: .init(
						get: {
							frozenNodes.contains(node)
						},
						set: { frozen in
							if frozen {
								frozenNodes.insert(node)
							} else {
								frozenNodes.remove(node)
							}
						}
					)
				)
				.position(position(of: node, in: geometry))
			}
		}
	}
}

struct GraphLayout_Previews: PreviewProvider {
	static var previews: some View {
		GraphLayout(graph: levels[0].graph)
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
