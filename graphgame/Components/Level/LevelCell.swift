import SwiftUI

struct LevelCell: View {
	private let level: Level
	
	@Environment(\.managedObjectContext)
	private var context
	
	@FetchRequest
	private var solutions: FetchedResults<Solution>
	
	private var solution: Solution? {
		solutions.count > 0 ? solutions[0] : nil
	}
	
	init(level: Level) {
		self.level = level
		_solutions = Solution.for(level: level)
	}
	
	private var destination: some View {
		LevelView(level: level)
			.environment(\.managedObjectContext, context)
	}
	
	var body: some View {
		NavigationLink(destination: destination) {
			ZStack {
				RoundedRectangle(cornerRadius: 15)
					.stroke(Color("Border"))
					.aspectRatio(contentMode: .fill)
				Text("level \(level.id)")
					.bold()
					.foregroundColor(.black)
				Stars(stars: solution?.stars ?? 0)
					.offset(y: 25)
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
