import SwiftUI

private let autoAdvanceDelay: Duration = .seconds(3)
private let white70 = Color.white.opacity(0.7)
private let cardSurface = Color(red: 0.075, green: 0.090, blue: 0.165)

struct PortfolioView: View {
    @State private var viewModel = AppContainer.shared.makePortfolioViewModel()
    @State private var currentPage = 0
    @Environment(\.openURL) private var openURL

    var body: some View {
        ZStack {
            SpaceBackgroundView()

            VStack(alignment: .leading, spacing: 0) {
                header
                pager
                dots
                Spacer()
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("OUR WORK")
                    .font(.headline.weight(.bold))
                    .foregroundStyle(BrandColors.primary)
                Spacer()
                Text("Made by Artificialss")
                    .font(.caption)
                    .foregroundStyle(white70)
            }
            Text("Portfolio")
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(.white)
            Text("A few of the products we've shipped — including the public showcase repos this app is part of.")
                .font(.subheadline)
                .foregroundStyle(white70)
        }
        .padding(24)
    }

    private var pager: some View {
        TabView(selection: $currentPage) {
            ForEach(Array(viewModel.items.enumerated()), id: \.offset) { index, item in
                PortfolioCard(item: item) {
                    openURL(item.url)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
                .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 420)
        .task {
            await autoAdvance()
        }
    }

    private var dots: some View {
        HStack(spacing: 8) {
            ForEach(viewModel.items.indices, id: \.self) { index in
                Circle()
                    .fill(index == currentPage ? Color.white : Color.white.opacity(0.35))
                    .frame(width: index == currentPage ? 8 : 6, height: index == currentPage ? 8 : 6)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
    }

    private func autoAdvance() async {
        guard viewModel.items.count > 1 else { return }
        while !Task.isCancelled {
            try? await Task.sleep(for: autoAdvanceDelay)
            withAnimation {
                currentPage = (currentPage + 1) % viewModel.items.count
            }
        }
    }
}

private struct PortfolioCard: View {
    let item: PortfolioItem
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 0) {
                PortfolioMockupView(id: item.id)
                    .frame(height: 160)

                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title)
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text(item.subtitle)
                        .font(.subheadline)
                        .foregroundStyle(white70)
                        .fixedSize(horizontal: false, vertical: true)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 6) {
                            ForEach(item.tags, id: \.self) { tag in
                                Text(tag)
                                    .font(.caption2)
                                    .foregroundStyle(white70)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.white.opacity(0.12))
                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                            }
                        }
                        .padding(.top, 4)
                    }

                    Text("View project")
                        .font(.caption.weight(.medium))
                        .foregroundStyle(BrandColors.primary)
                        .padding(.top, 4)
                }
                .padding(16)
            }
            .background(cardSurface)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    PortfolioView()
}
