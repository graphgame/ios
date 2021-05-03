import SwiftUI

private let arrowAngle = CGFloat(Angle(degrees: 30).radians)
private let arrowLength: CGFloat = 15

struct Edges: View {
	private let graph: Graph
	
	init(graph: Graph) {
		self.graph = graph
	}
	
	private func draw(_ edge: Edge, on path: inout Path, in geometry: GeometryProxy) {
		let from = edge.from.position(in: geometry)
		let to = edge.to.position(in: geometry)
		
		let slope = (to.y - from.y) / (to.x - from.x)
		let angle = atan(slope)
		
		let direction: CGFloat = to.x < from.x ? -1 : 1
		let offset = .init(x: cos(angle), y: sin(angle)) * direction * Node.radius
		
		let fromEdge = from + offset
		let toEdge = to - offset
		
		path.move(to: fromEdge)
		path.addLine(to: toEdge)
		
		let wingOffsetA = .init(x: cos(angle + arrowAngle), y: sin(angle + arrowAngle)) * direction * arrowLength
		let wingOffsetB = .init(x: cos(angle - arrowAngle), y: sin(angle - arrowAngle)) * direction * arrowLength
		
		path.move(to: toEdge)
		path.addLine(to: toEdge - wingOffsetA)
		
		path.move(to: toEdge)
		path.addLine(to: toEdge - wingOffsetB)
	}
	
	var body: some View {
		GeometryReader { geometry in
			Path { path in
				for edge in graph.edges {
					draw(edge, on: &path, in: geometry)
				}
			}
			.stroke(lineWidth: 2)
		}
	}
}

struct Edges_Previews: PreviewProvider {
	static var previews: some View {
		Edges(graph: levels[0].graph)
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
