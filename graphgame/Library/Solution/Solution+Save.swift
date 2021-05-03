import CoreData

extension Solution {
	static func save(in context: NSManagedObjectContext, submission: Submission) {
		guard let stars = submission.stars else { return }
		
		let solution = Solution(context: context)
		
		solution.level = submission.level.id
		solution.stars = stars
		solution.date = submission.date
		
		context.saveIfChanged()
	}
}
