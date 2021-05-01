import SwiftUI
import CoreData

private let itemFormatter: DateFormatter = {
	let formatter = DateFormatter()
	
	formatter.dateStyle = .short
	formatter.timeStyle = .medium
	
	return formatter
}()

struct HomeView: View {
	@Environment(\.managedObjectContext) private var context
	
	@FetchRequest(sortDescriptors: [.init(keyPath: \Item.timestamp, ascending: true)])
	private var items: FetchedResults<Item>
	
	private func addItem() {
		withAnimation {
			let item = Item(context: context)
			item.timestamp = Date()
			
			do {
				try context.save()
			} catch {
				print(error)
			}
		}
	}
	
	private func deleteItems(indices: IndexSet) {
		withAnimation {
			for index in indices {
				context.delete(items[index])
			}
			
			do {
				try context.save()
			} catch {
				print(error)
			}
		}
	}
	
	var body: some View {
		List {
			ForEach(items) { item in
				Text("Item at \(item.timestamp!, formatter: itemFormatter)")
			}
			.onDelete(perform: deleteItems)
		}
		.toolbar {
			ToolbarItem(placement: .navigationBarLeading) {
				EditButton()
			}
			ToolbarItem(placement: .navigationBarTrailing) {
				Button(action: addItem) {
					Label("Add Item", systemImage: "plus")
				}
			}
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
			.environment(
				\.managedObjectContext,
				Persistence.preview.container.viewContext
			)
	}
}
