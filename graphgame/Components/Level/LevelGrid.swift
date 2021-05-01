import SwiftUI

struct LevelGrid: View {
	static let spacing: CGFloat = 12
	
	static let columns = [
		GridItem(.adaptive(minimum: 120, maximum: 200), spacing: spacing)
	]
	
	var body: some View {
		ScrollView(showsIndicators: false) {
			LazyVGrid(columns: Self.columns, spacing: Self.spacing) {
				ForEach(levels, content: LevelCell.init)
			}
			.padding(.horizontal, Self.spacing)
		}
	}
}

struct LevelGrid_Previews: PreviewProvider {
	static var previews: some View {
		LevelGrid()
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
