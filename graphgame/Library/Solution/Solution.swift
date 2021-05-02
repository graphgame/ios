import CoreData

extension Solution {
	@discardableResult
	convenience init(context: NSManagedObjectContext, level: Level, stars: Int16) {
		self.init(context: context)
		
		self.level = level.id
		self.stars = stars
	}
}
