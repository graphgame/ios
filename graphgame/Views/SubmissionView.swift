import SwiftUI
import CoreData

struct SubmissionView: View {
	private let submission: Submission
	
	@FetchRequest
	private var solutions: FetchedResults<Solution>
	
	private var solution: Solution? {
		solutions.count > 0 ? solutions[0] : nil
	}
	
	init(submission: Submission) {
		self.submission = submission
		
		_solutions = .init(
			sortDescriptors: [],
			predicate: .init(format: "level = %i", submission.level.id)
		)
	}
	
	var body: some View {
		Text("\(submission.level.id)")
	}
}

struct SubmissionView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			SubmissionView(submission: .init(level: levels[0], frozenNodes: .init()))
				.environment(\.managedObjectContext, Persistence.preview.context)
		}
	}
}
