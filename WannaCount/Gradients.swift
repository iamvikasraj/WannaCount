import SwiftUI

// MARK: - Stroke Gradients
let topbottom = LinearGradient(
    gradient: Gradient(stops: [
        .init(color: Color.white.opacity(0.9), location: 0.0),
        .init(color: Color.white.opacity(0.1), location: 0.4)
    ]),
    startPoint: .top,
    endPoint: .bottom
)

let bottomtop = LinearGradient(
    gradient: Gradient(stops: [
        .init(color: Color.white.opacity(0.7), location: 0.0),
        .init(color: Color.white.opacity(0.0), location: 0.3)
    ]),
    startPoint: .bottom,
    endPoint: .top
)

let leftotop = LinearGradient(
    gradient: Gradient(stops: [
        .init(color: Color.black.opacity(0.08), location: 0.0),
        .init(color: Color.black.opacity(0.0), location: 0.3)
    ]),
    startPoint: .leading,
    endPoint: .topTrailing
)

let rightotop = LinearGradient(
    gradient: Gradient(stops: [
        .init(color: Color.black.opacity(0.12), location: 0.0),
        .init(color: Color.black.opacity(0.0), location: 0.25)
    ]),
    startPoint: .trailing,
    endPoint: .topLeading
)

