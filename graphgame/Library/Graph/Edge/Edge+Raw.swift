extension Edge {
	final class Raw: GraphComponent {
		let from: String
		let to: String
		
		init(from: String, to: String) {
			self.from = from
			self.to = to
		}
	}
}

infix operator -->

func --> (from: String, to: String) -> Edge.Raw {
	.init(from: from, to: to)
}
