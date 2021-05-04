import SwiftUI
import CoreData

struct LevelView: View {
	@State
	private var level: Level
	
	init(level: Level) {
		_level = .init(initialValue: level)
	}
	
	var body: some View {
		LevelViewContent(level: $level)
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
