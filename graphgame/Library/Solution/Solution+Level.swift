import SwiftUI
import CoreData

extension Solution {
	static func `for`(level: Level) -> NSFetchRequest<Solution> {
		let request: NSFetchRequest<Solution> = fetchRequest()
		
		request.sortDescriptors = [
			.init(keyPath: \Solution.stars, ascending: false)
		]
		
		request.predicate = .init(format: "level = %i", level.id)
		request.fetchLimit = 1
		
		return request
	}
	
	static func `for`(level: Level) -> FetchRequest<Solution> {
		.init(fetchRequest: `for`(level: level))
	}
}
