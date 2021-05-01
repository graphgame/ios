import CoreData

struct Persistence {
	static let shared = Persistence()
	
	static var preview: Persistence = {
		let result = Persistence(inMemory: true)
		let viewContext = result.container.viewContext
		
		for _ in 0..<10 {
			let newItem = Item(context: viewContext)
			newItem.timestamp = Date()
		}
		
		do {
			try viewContext.save()
		} catch {
			print(error)
		}
		
		return result
	}()
	
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
