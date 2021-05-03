import SwiftUI
import CoreData

struct Stars: View {
	private let stars: Int16
	
	init(stars: Int16) {
		self.stars = stars
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
	static var previews: some View {
		Stars(stars: 2)
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
