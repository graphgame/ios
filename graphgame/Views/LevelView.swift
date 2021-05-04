import SwiftUI
import CoreData

struct LevelView: View {
	private let level: Level
	
	@Environment(\.managedObjectContext)
	var context
	
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
		_solutions = Solution.for(level: level)
	}
	
	private func loadFrozenNodes() {
		frozenNodes = .init(
			solution?.frozenNodes?.compactMap { level.graph[$0] } ?? []
		)
	}
	
	private func submit() {
		submission = .init(level: level, frozenNodes: frozenNodes)
	}
	
	private func destination(submission: Submission) -> some View {
		SubmissionView(submission: submission)
			.environment(\.managedObjectContext, context)
	}
	
	var body: some View {
		VStack {
			Spacer()
			GraphLayout(graph: level.graph, frozenNodes: $frozenNodes)
			Spacer()
			PrimaryButton(action: submit) {
				Text("Submit")
					.bold()
			}
		}
		.navigationBarTitle("level \(level.id)", displayMode: .inline)
		.navigationBarItems(trailing: Stars(stars: solution?.stars ?? 0))
		.padding()
		.sheet(item: $submission, content: destination)
		.onAppear(perform: loadFrozenNodes)
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
