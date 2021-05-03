import SwiftUI
import CoreData

struct LevelView: View {
	private let level: Level
	
	@FetchRequest
	private var solutions: FetchedResults<Solution>
	
	@State
	private var frozenNodes = Set<Node>()
	
	@State
	private var submission: Submission?
	
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
	
	private func submit() {
		submission = .init(level: level, frozenNodes: frozenNodes)
	}
	
	var body: some View {
		VStack {
			Spacer()
			GraphLayout(graph: level.graph, frozenNodes: $frozenNodes)
			Spacer()
			SubmitButton(action: submit)
		}
		.navigationBarTitle("level \(level.id)", displayMode: .inline)
		.navigationBarItems(trailing: Stars(stars: solution?.stars ?? 0))
		.padding()
		.sheet(item: $submission) { submission in
			SubmissionView(submission: submission)
		}
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
