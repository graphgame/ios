import SwiftUI

struct Nodes: View {
	private let graph: Graph
	
	@Binding
	private var frozenNodes: Set<Node>
	
	init(graph: Graph, frozenNodes: Binding<Set<Node>>) {
		self.graph = graph
		_frozenNodes = frozenNodes
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
				.position(node.position(in: geometry))
			}
		}
	}
}

struct Nodes_Previews: PreviewProvider {
	static var previews: some View {
		Nodes(graph: levels[0].graph, frozenNodes: .constant(.init()))
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
