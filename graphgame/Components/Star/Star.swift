import SwiftUI
import CoreData

struct Star: View {
	private let unlocked: Bool
	
	init(unlocked: Bool) {
		self.unlocked = unlocked
	}
	
	var body: some View {
		Image(systemName: unlocked ? "star.circle.fill" : "star.circle")
			.foregroundColor(unlocked ? .init("Gold") : .black)
			.opacity(unlocked ? 1 : 0.3)
	}
}

struct Star_Previews: PreviewProvider {
	static var previews: some View {
		Star(unlocked: true)
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
