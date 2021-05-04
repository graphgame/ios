import SwiftUI

extension Binding {
	func didSet(_ action: @escaping () -> Void) -> Self {
		.init { wrappedValue } set: {
			wrappedValue = $0
			action()
		}
	}
}
