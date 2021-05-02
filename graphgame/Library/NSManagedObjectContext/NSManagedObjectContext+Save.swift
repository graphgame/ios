import CoreData

extension NSManagedObjectContext {
	func saveIfChanged() {
		if !hasChanges { return }
		
		do {
			try save()
		} catch {
			print(error)
		}
	}
}
