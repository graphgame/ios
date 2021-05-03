extension Graph {
	@_functionBuilder
	struct Builder {
		static func buildBlock(_ components: GraphComponent...) -> Graph {
			.init(components: components)
		}
	}
}
