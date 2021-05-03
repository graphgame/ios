import SwiftUI
import CoreData

struct LevelView: View {
	private let level: Level
	
	@Environment(\.managedObjectContext)
	private var context
	
	@FetchRequest
	private var solutions: FetchedResults<Solution>
	
	@State
	private var frozenNodes = Set<Node>()
	
	var solution: Solution? {
		solutions.count > 0 ? solutions[0] : nil
	}
	
	init(level: Level) {
		_solutions = .init(
			sortDescriptors: [],
			predicate: .init(format: "level = %i", level.id)
		)
		
		self.level = level
	}
	
	var body: some View {
		GraphLayout(graph: level.graph, frozenNodes: $frozenNodes)
			.navigationBarTitle("level \(level.id)", displayMode: .inline)
			.navigationBarItems(trailing: Stars(stars: solution?.stars ?? 0))
	}
}

struct LevelView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			LevelView(level: levels[0])
				.environment(\.managedObjectContext, Persistence.preview.context)
		}
	}
}
