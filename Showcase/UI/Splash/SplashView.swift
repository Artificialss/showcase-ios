import SwiftUI

private let splashDelay: Duration = .milliseconds(700)
private let fadeDuration: Double = 0.4
private let brandGreen = Color(red: 0.204, green: 0.494, blue: 0.404)

/// Fades in the brand logo and tagline on the brand-green background, then
/// auto-navigates to the main tab view — matching Showcase.Android's
/// SplashScreen.
struct SplashView: View {
    let onFinished: () -> Void

    @State private var visible = false

    var body: some View {
        ZStack {
            brandGreen.ignoresSafeArea()

            VStack(spacing: 8) {
                LogoView(size: 180, animated: false)
                    .padding(.bottom, 24)
                Text("Artificialss")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundStyle(.white)
                Text("Showcase")
                    .font(.title2)
                    .foregroundStyle(.white.opacity(0.8))
            }
            .opacity(visible ? 1 : 0)
        }
        .task {
            withAnimation(.easeOut(duration: fadeDuration)) {
                visible = true
            }
            try? await Task.sleep(for: splashDelay)
            onFinished()
        }
    }
}

#Preview {
    SplashView(onFinished: {})
}
