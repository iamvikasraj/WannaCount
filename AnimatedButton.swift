import SwiftUI

// MARK: - AnimatedButton
struct AnimatedButton: View {
    let text: String
    let cornerRadius: CGFloat
    let action: () -> Void

    @State private var isPressed = false

    init(text: String, cornerRadius: CGFloat = ButtonConfig.cornerRadius, action: @escaping () -> Void = {}) {
        self.text = text
        self.cornerRadius = cornerRadius
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Text(text)
                    .font(.system(size: 16, weight: .regular, design: .monospaced))
                    .foregroundColor(Color.glassyButtonFill)
                    .shadow(color: .black.opacity(0.1), radius: 1, y: 1)
                    .contentTransition(.numericText())
                    .animation(
                        .spring(
                            response: ButtonConfig.springResponse,
                            dampingFraction: ButtonConfig.springDamping
                        ), value: text)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.buttonFill)
                    .background(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(Color.buttonFill)
                            .blur(radius: ButtonConfig.blurRadius * 0.75)
                    )
                    .overlay(strokeOverlay)
            )
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        }
        .contentShape(RoundedRectangle(cornerRadius: cornerRadius))
        .shadow(color: .black.opacity(isPressed ? 0.1 : 0.25), radius: isPressed ? 4 : ButtonConfig.shadowRadius, y: isPressed ? 8 : 12)
        .scaleEffect(isPressed ? ButtonConfig.pressedScale : 1)
        .animation(
            .spring(
                response: ButtonConfig.springResponse,
                dampingFraction: ButtonConfig.springDamping
            ),
            value: isPressed
        )
        .onPressGesture(
            pressing: { pressing in isPressed = pressing },
            perform: {}
        )
    }

    // MARK: - Stroke Overlay
    var strokeOverlay: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(leftotop, lineWidth: ButtonConfig.strokeWidth)
                .blendMode(.darken)

            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(rightotop, lineWidth: ButtonConfig.strokeWidth)
                .blendMode(.darken)

            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(bottomtop, lineWidth: ButtonConfig.strokeWidth)
                .blendMode(.overlay)

            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(topbottom, lineWidth: ButtonConfig.strokeWidth)
        }
    }
}



#Preview{
    AnimatedButton(text: "this")
}
