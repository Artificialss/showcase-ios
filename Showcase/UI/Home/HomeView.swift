import SwiftUI

struct HomeView: View {
    @State private var viewModel = AppContainer.shared.makeHomeViewModel()
    @Environment(\.openURL) private var openURL

    var body: some View {
        VStack(spacing: 0) {
            LogoView(size: 240)
                .padding(.bottom, 24)

            Text("From Idea to\nAI-Powered Prototype")
                .font(.system(size: 34, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundStyle(BrandColors.foreground)

            Text("We help you build, launch, and scale your vision with expert software engineering and AI integration for early-stage ventures.")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundStyle(BrandColors.mutedForeground)
                .padding(.top, 12)

            Button {
                openURL(viewModel.ctaUrl)
            } label: {
                HStack(spacing: 8) {
                    Text("Explore Our Services")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 14)
            }
            .background(BrandColors.primary)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .padding(.top, 24)
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(BrandColors.background)
    }
}

#Preview {
    HomeView()
}
