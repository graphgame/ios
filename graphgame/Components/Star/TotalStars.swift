import SwiftUI
import CoreData

struct TotalStars: View {
	@FetchRequest<Solution>(sortDescriptors: [])
	var solutions
	
	var stars: Int {
		solutions.reduce(0) { $0 + Int($1.stars) }
	}
	
	var body: some View {
		Text("\(stars)")
	}
}

struct TotalStars_Previews: PreviewProvider {
	static var previews: some View {
		TotalStars()
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
