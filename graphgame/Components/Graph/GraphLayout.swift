import SwiftUI

struct GraphLayout: View {
	@Environment(\.managedObjectContext)
	private var context
	
	private let graph: Graph
	
	init(graph: Graph) {
		self.graph = graph
	}
	
	var body: some View {
		ForEach(graph.nodes) { node in
			Text(node.id)
		}
	}
}

struct GraphLayout_Previews: PreviewProvider {
	static var previews: some View {
		GraphLayout(graph: levels[0].graph)
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
