import SwiftUI

/// The real Artificialss logo — the same mark used on artificialss.ai —
/// with an animated "Powered by AI" sign overlay, matching the web logo's
/// wood-sign animation.
struct LogoView: View {
    var size: CGFloat = 96
    var animated: Bool = true

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: size)

            if animated {
                PoweredByAIBadge()
                    .offset(x: size * 0.18, y: size * 0.04)
            }
        }
        .frame(width: size, height: size, alignment: .center)
    }
}

private struct PoweredByAIBadge: View {
    @State private var swinging = false

    var body: some View {
        VStack(spacing: 2) {
            Text("Powered")
                .font(.system(size: 13, weight: .bold))
                .foregroundStyle(.white)
            Text("by AI")
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(Color(red: 0.24, green: 0.86, blue: 0.52))
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background(Color(red: 0.36, green: 0.24, blue: 0.18))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .rotationEffect(.degrees(swinging ? 4 : -4))
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                swinging = true
            }
        }
    }
}

#Preview {
    LogoView(size: 200)
}
