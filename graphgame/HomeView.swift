import SwiftUI
import CoreData

struct HomeView: View {
	static let spacing: CGFloat = 8
	
	static let columns = [
		GridItem(.adaptive(minimum: 120, maximum: 200), spacing: spacing)
	]
	
	var body: some View {
		ScrollView(showsIndicators: false) {
			LazyVGrid(columns: Self.columns, spacing: Self.spacing) {
				ForEach(0..<100) { index in
					Rectangle()
						.aspectRatio(contentMode: .fill)
				}
			}
			.padding(.horizontal, Self.spacing)
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
			.environment(
				\.managedObjectContext,
				Persistence.preview.container.viewContext
			)
	}
}
