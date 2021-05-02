import SwiftUI

struct LevelView: View {
	let level: Level
	
	var body: some View {
		Text("level \(level.id)")
	}
}

struct LevelView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			LevelView(level: levels[0])
				.environment(\.managedObjectContext, Persistence.preview.context)
		}
	}
}
