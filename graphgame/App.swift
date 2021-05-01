import SwiftUI

@main
struct graphgameApp: App {
	let persistence = Persistence.shared
	
	var body: some Scene {
		WindowGroup {
			HomeView()
				.environment(\.managedObjectContext, persistence.context)
		}
	}
}
