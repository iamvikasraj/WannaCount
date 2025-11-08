import SwiftUI

// MARK: - Custom Colors
extension Color {
    static let buttonFill = Color(red: 125/255, green: 135/255, blue: 140/255).opacity(0.00)
    static let glassyButtonFill = Color.black.opacity(1.0)
    
    static let frostedBackgroundGradient = LinearGradient(
        colors: [
            Color(red: 0.9, green: 0.9, blue: 0.9),
            Color(red: 0.8, green: 0.82, blue: 0.85)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

