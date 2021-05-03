import SwiftUI

struct SubmitButton: View {
	private let action: () -> Void
	
	init(action: @escaping () -> Void) {
		self.action = action
	}
	
	var body: some View {
		Button(action: action) {
			Text("Submit")
				.bold()
				.frame(maxWidth: .infinity)
				.frame(height: 60)
				.foregroundColor(.white)
				.background(Color("Blue"))
				.cornerRadius(15)
		}
	}
}

struct SubmitButton_Previews: PreviewProvider {
	static var previews: some View {
		SubmitButton { print("Submit") }
			.frame(width: 120, height: 120)
			.environment(\.managedObjectContext, Persistence.preview.context)
	}
}
