import SwiftUI
import CoreData

struct LevelView: View {
	private let level: Level
	
	@FetchRequest
	private var solutions: FetchedResults<Solution>
	
	@State
	private var frozenNodes = Set<Node>()
	
	private var solution: Solution? {
		solutions.count > 0 ? solutions[0] : nil
	}
	
	init(level: Level) {
		self.level = level
		
		_solutions = .init(
			sortDescriptors: [],
			predicate: .init(format: "level = %i", level.id)
		)
	}
	
	var body: some View {
		VStack {
			Spacer()
			GraphLayout(graph: level.graph, frozenNodes: $frozenNodes)
			Spacer()
			Button {
				print("Submit")
			} label: {
				Text("Submit")
					.bold()
					.frame(maxWidth: .infinity)
					.frame(height: 60)
					.foregroundColor(.white)
					.background(Color("Blue"))
					.cornerRadius(15)
			}
		}
		.navigationBarTitle("level \(level.id)", displayMode: .inline)
		.navigationBarItems(trailing: Stars(stars: solution?.stars ?? 0))
		.padding()
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
