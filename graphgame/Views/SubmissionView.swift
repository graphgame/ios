import SwiftUI
import CoreData

struct SubmissionView: View {
	private let submission: Submission
	
	@Environment(\.managedObjectContext)
	private var context
	
	@Environment(\.presentationMode)
	private var presentationMode
	
	@FetchRequest
	private var solutions: FetchedResults<Solution>
	
	@Binding
	private var level: Level
	
	private var solution: Solution? {
		solutions.count > 0 ? solutions[0] : nil
	}
	
	private var valid: Bool {
		submission.stars != nil
	}
	
	init(level: Binding<Level>, submission: Submission) {
		self.submission = submission
		
		_solutions = Solution.for(level: submission.level)
		_level = level
	}
	
	private func save() {
		Solution.save(in: context, submission: submission)
	}
	
	private func retry() {
		presentationMode.wrappedValue.dismiss()
	}
	
	private func next() {
		level = level.next!
		presentationMode.wrappedValue.dismiss()
	}
	
	private func action(primary: Bool) -> () -> Void {
		primary ? next : retry
	}
	
	private func label(primary: Bool) -> some View {
		HStack(spacing: 4) {
			if !primary {
				Image(systemName: "arrow.clockwise")
			}
			Text(primary ? "Next" : "Retry")
			if primary {
				Image(systemName: "arrow.right.circle")
			}
		}
		.font(Font.body.weight(.bold))
	}
	
	var body: some View {
		VStack(spacing: 8) {
			Text(
				submission.stars == nil
					? "That isn't right..."
					: "Level \(submission.level.id) complete!"
			)
			.font(.title)
			.bold()
			.frame(maxWidth: .infinity, alignment: .leading)
			Spacer()
			Stars(stars: submission.stars ?? 0)
			Spacer()
			Button(action: action(primary: !valid)) {
				label(primary: !valid)
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			PrimaryButton(action: action(primary: valid)) {
				label(primary: valid)
			}
		}
		.padding()
		.onAppear(perform: save)
	}
}

struct SubmissionView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			SubmissionView(
				level: .constant(levels[0]),
				submission: .init(level: levels[0], frozenNodes: .init())
			)
			.environment(\.managedObjectContext, Persistence.preview.context)
		}
	}
}
