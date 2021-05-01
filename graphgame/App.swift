import SwiftUI

@main
struct graphgameApp: App {
	let persistence = Persistence.shared
	
	var body: some Scene {
		WindowGroup {
			NavigationView {
				HomeView()
					.environment(
						\.managedObjectContext,
						persistence.container.viewContext
					)
			}
		}
	}
}
