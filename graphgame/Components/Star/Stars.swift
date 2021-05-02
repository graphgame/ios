import SwiftUI
import CoreData

struct Stars: View {
	private let solution: Solution?
	
	private var stars: Int16 {
		solution?.stars ?? 0
	}
	
	init(solution: Solution?) {
		self.solution = solution
	}
	
	var body: some View {
		HStack(spacing: 4) {
			ForEach(0..<3) { index in
				Star(unlocked: stars > index)
			}
		}
	}
}

struct Stars_Previews: PreviewProvider {
	private static let solution = Solution(
		context: Persistence.preview.context,
		level: levels[0],
		stars: 2
	)
	
	static var previews: some View {
		Stars(solution: solution)
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
