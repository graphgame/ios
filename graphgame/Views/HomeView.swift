import SwiftUI

struct HomeView: View {
	var body: some View {
		LevelGrid()
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
