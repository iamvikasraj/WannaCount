import SwiftUI

// MARK: - Press Gesture Extension
extension View {
    func onPressGesture(pressing: @escaping (Bool) -> Void, perform: @escaping () -> Void) -> some View {
        self.simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in pressing(true) }
                .onEnded { _ in
                    pressing(false)
                    perform()
                }
        )
    }
}

