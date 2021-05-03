import SwiftUI

struct Edges: View {
	private let graph: Graph
	
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
	
	private func draw(_ edge: Edge, on path: inout Path, in geometry: GeometryProxy) {
		let from = position(of: edge.from, in: geometry)
		let to = position(of: edge.to, in: geometry)
		
		let slope = (to.y - from.y) / (to.x - from.x)
		let angle = atan(slope)
		
		let direction: CGFloat = to.x < from.x ? -1 : 1
		let offset = .init(x: cos(angle), y: sin(angle)) * direction * Node.radius
		
		path.move(to: from + offset)
		path.addLine(to: to - offset)
	}
	
	var body: some View {
		GeometryReader { geometry in
			Path { path in
				for edge in graph.edges {
					draw(edge, on: &path, in: geometry)
				}
			}
			.stroke()
		}
	}
}

struct Edges_Previews: PreviewProvider {
	static var previews: some View {
		Edges(graph: levels[0].graph)
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}