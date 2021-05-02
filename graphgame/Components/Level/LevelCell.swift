import SwiftUI

struct LevelCell: View {
	let level: Level
	
	var body: some View {
		NavigationLink(destination: LevelView(level: level)) {
			ZStack {
				RoundedRectangle(cornerRadius: 15)
					.stroke(Color("Border"))
					.aspectRatio(contentMode: .fill)
				Text("level \(level.id)")
					.font(.system(size: 16, weight: .bold))
					.foregroundColor(.black)
			}
		}
	}
}

struct LevelCell_Previews: PreviewProvider {
	static var previews: some View {
		LevelCell(level: levels[0])
			.frame(width: 120, height: 120)
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
