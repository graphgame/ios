import SwiftUI
import CoreData

struct TotalStars: View {
	@FetchRequest<Solution>(
		sortDescriptors: [.init(keyPath: \Solution.stars, ascending: false)],
		predicate: .init(format: "stars > 0")
	)
	private var solutions
	
	private var stars: Int16 {
		var levels = Set<Int16>()
		
		return solutions.reduce(0) { stars, solution in
			levels.insert(solution.level).inserted
				? stars + solution.stars
				: stars
		}
	}
	
	var body: some View {
		HStack(spacing: 4) {
			Text(stars.description)
				.foregroundColor(.init("Gold"))
			Star(unlocked: true)
		}
	}
}

struct TotalStars_Previews: PreviewProvider {
	static var previews: some View {
		TotalStars()
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
