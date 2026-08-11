import SwiftUI

struct RootView: View {
    @State private var showSplash = true

    var body: some View {
        ZStack {
            if showSplash {
                SplashView {
                    withAnimation {
                        showSplash = false
                    }
                }
            } else {
                MainTabView()
            }
        }
    }
}

private struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            PortfolioView()
                .tabItem {
                    Label("Portfolio", systemImage: "square.grid.2x2.fill")
                }
        }
        .tint(BrandColors.primary)
    }
}

#Preview {
    RootView()
}
