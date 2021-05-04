import SwiftUI

struct GraphLayout: View {
	private let graph: Graph
	
	@Binding
	private var frozenNodes: Set<Node>?
	
	init(graph: Graph, frozenNodes: Binding<Set<Node>?>) {
		self.graph = graph
		_frozenNodes = frozenNodes
	}
	
	var body: some View {
		ZStack {
			Edges(graph: graph)
			Nodes(graph: graph, frozenNodes: $frozenNodes)
		}
		.aspectRatio(Graph.size, contentMode: .fit)
	}
}

struct GraphLayout_Previews: PreviewProvider {
	static var previews: some View {
		GraphLayout(graph: levels[0].graph, frozenNodes: .constant(.init()))
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
