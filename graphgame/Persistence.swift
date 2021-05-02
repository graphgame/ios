import CoreData

struct Persistence {
	static let shared = Persistence()
	static let preview = Persistence(inMemory: true)
	
	let container: NSPersistentContainer
	
	var context: NSManagedObjectContext {
		container.viewContext
	}
	
	init(inMemory: Bool = false) {
		container = NSPersistentContainer(name: "graphgame")
		
		if inMemory, let description = container.persistentStoreDescriptions.first {
			description.url = URL(fileURLWithPath: "/dev/null")
		}
		
		container.loadPersistentStores { _, error in
			guard let error = error as NSError? else { return }
			print(error)
		}
	}
}
