import SwiftUI

private let spacing: CGFloat = 16

private let columns = [
	GridItem(.adaptive(minimum: 120, maximum: 200), spacing: spacing)
]

struct LevelGrid: View {
	var body: some View {
		ScrollView(showsIndicators: false) {
			LazyVGrid(columns: columns, spacing: spacing) {
				ForEach(levels, content: LevelCell.init)
			}
			.padding(spacing)
		}
	}
}

struct LevelGrid_Previews: PreviewProvider {
	static var previews: some View {
		LevelGrid()
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
