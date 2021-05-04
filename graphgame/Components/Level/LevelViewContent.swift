import SwiftUI
import CoreData

struct LevelViewContent: View {
	@Environment(\.managedObjectContext)
	private var context
	
	@FetchRequest
	private var solutions: FetchedResults<Solution>
	
	@Binding
	private var level: Level
	
	@State
	private var frozenNodes: Set<Node>?
	
	@State
	private var submission: Submission?
	
	private var solution: Solution? {
		solutions.count > 0 ? solutions[0] : nil
	}
	
	init(level: Binding<Level>) {
		_level = level
		_solutions = Solution.for(level: level.wrappedValue)
	}
	
	private func resetFrozenNodes() {
		frozenNodes = nil
	}
	
	private func setInitialFrozenNodes() {
		guard frozenNodes == nil else { return }
		
		frozenNodes = .init(
			solution?.frozenNodes?.compactMap { level.graph[$0] } ?? []
		)
	}
	
	private func submit() {
		guard let frozenNodes = frozenNodes else { return }
		submission = .init(level: level, frozenNodes: frozenNodes)
	}
	
	private func destination(submission: Submission) -> some View {
		SubmissionView(
			level: $level.didSet(resetFrozenNodes),
			submission: submission
		)
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
		.sheet(
			item: $submission,
			onDismiss: setInitialFrozenNodes,
			content: destination
		)
		.onAppear(perform: setInitialFrozenNodes)
	}
}

struct LevelViewContent_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			LevelViewContent(level: .constant(levels[0]))
				.environment(\.managedObjectContext, Persistence.preview.context)
		}
	}
}
