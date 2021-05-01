import SwiftUI

struct LevelCell: View {
	let level: Level
	
	var body: some View {
		ZStack {
			Rectangle()
				.foregroundColor(.white)
				.cornerRadius(15)
				.shadow(color: Color.black.opacity(0.15), radius: 3)
				.aspectRatio(contentMode: .fill)
			Text("level \(level.id)")
				.font(.caption)
				.bold()
		}
	}
}

struct LevelCell_Previews: PreviewProvider {
	static var previews: some View {
		LevelCell(level: levels[0])
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
