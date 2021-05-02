import SwiftUI
import CoreData

struct LevelView: View {
	@Environment(\.managedObjectContext)
	private var context
	
	@FetchRequest
	private var solutions: FetchedResults<Solution>
	
	private let level: Level
	
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
		Button {
			Solution(context: context, level: level, stars: 2)
			context.saveIfChanged()
		} label: {
			Text("2 stars")
		}
		.navigationBarTitle("level \(level.id)", displayMode: .inline)
		.navigationBarItems(trailing: Stars(solution: solution))
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
