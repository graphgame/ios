import SwiftUI

@main
struct graphgameApp: App {
	private let persistence = Persistence.shared
	
	init() {
		UINavigationBar.appearance().barTintColor = .white
	}
	
	var body: some Scene {
		WindowGroup {
			NavigationView {
				HomeView()
					.environment(\.managedObjectContext, persistence.context)
			}
		}
	}
}
