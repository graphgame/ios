import SwiftUI
import CoreData

struct TotalStars: View {
	@Environment(\.managedObjectContext)
	private var context
	
	@FetchRequest<Solution>(sortDescriptors: [])
	private var solutions
	
	private var stars: Int16 {
		solutions.reduce(0) { $0 + $1.stars }
	}
	
	var body: some View {
		HStack(spacing: 4) {
			Text(stars.description)
			Image(systemName: "star.circle.fill")
		}
		.foregroundColor(.init("Gold"))
	}
}

struct TotalStars_Previews: PreviewProvider {
	static var previews: some View {
		TotalStars()
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
