import SwiftUI
import CoreData

struct TotalStars: View {
	@Environment(\.managedObjectContext)
	var context
	
	@FetchRequest<Solution>(sortDescriptors: [])
	var solutions
	
	var stars: Int16 {
		solutions.reduce(0) { $0 + $1.stars }
	}
	
	var body: some View {
		Button {
			Solution(context: context, level: levels[0], stars: 2)
			context.saveIfChanged()
		} label: {
			Text("\(stars)")
		}
	}
}

struct TotalStars_Previews: PreviewProvider {
	static var previews: some View {
		TotalStars()
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
