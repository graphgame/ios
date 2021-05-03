import SwiftUI

struct PrimaryButton<Label: View>: View {
	private let action: () -> Void
	private let label: () -> Label
	
	init(
		action: @escaping () -> Void,
		@ViewBuilder label: @escaping () -> Label
	) {
		self.action = action
		self.label = label
	}
	
	var body: some View {
		Button(action: action) {
			label()
				.frame(maxWidth: .infinity)
				.frame(height: 60)
				.foregroundColor(.white)
				.background(Color("Blue"))
				.cornerRadius(15)
		}
	}
}

struct PrimaryButton_Previews: PreviewProvider {
	static var previews: some View {
		PrimaryButton {
			print("Submit")
		} label: {
			Text("Submit")
				.bold()
		}
		.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
