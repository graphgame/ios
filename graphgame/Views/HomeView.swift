import SwiftUI

struct HomeView: View {
	var body: some View {
		LevelGrid()
			.navigationBarTitle("graphgame", displayMode: .inline)
			.navigationBarItems(trailing: TotalStars())
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			HomeView()
				.environment(\.managedObjectContext, Persistence.preview.context)
		}
	}
}
