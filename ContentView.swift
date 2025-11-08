import SwiftUI

// MARK: - Main View
struct GlassButton: View {
    @State private var buttonLabel = "Wanna Count?"
    @State private var progress: Int = 0
    @State private var isAnimating = false

    var body: some View {
        VStack(spacing: 40) {
            AnimatedButton(text: buttonLabel) {
                guard !isAnimating else { return }
                isAnimating = true
                progress = 0
                animateProgress()
            }
            .scaleEffect(1.0)
            .buttonStyle(.plain)
            .shadow(radius: 3)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .shadow(color: Color.white.opacity(0.8), radius: 1, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.4), radius: 3, x: 8, y: 8)
        .background(Color.frostedBackgroundGradient)
    }

    private func animateProgress() {
        Timer.scheduledTimer(withTimeInterval: 0.10, repeats: true) { timer in
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                progress += 1
                buttonLabel = String(format: "%02d", progress)
            }

            if progress >= 100 {
                timer.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(.spring()) {
                        buttonLabel = "Yayyyyyy!!!"
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation(.spring()) {
                        buttonLabel = "..one more time?"
                        isAnimating = false
                    }
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    GlassButton()
}
