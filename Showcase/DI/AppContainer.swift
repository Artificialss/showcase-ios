import Foundation

/// Lightweight, hand-rolled dependency container — the Swift-native
/// equivalent of the Koin module used on Android. One place wiring
/// repository -> use case -> ViewModel; no third-party DI framework.
@MainActor
final class AppContainer {
    static let shared = AppContainer()

    private let portfolioRepository: PortfolioRepository

    private init() {
        portfolioRepository = PortfolioRepositoryImpl()
    }

    func makeGetPortfolioItemsUseCase() -> GetPortfolioItemsUseCase {
        GetPortfolioItemsUseCase(repository: portfolioRepository)
    }

    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel()
    }

    func makePortfolioViewModel() -> PortfolioViewModel {
        PortfolioViewModel(getPortfolioItems: makeGetPortfolioItemsUseCase())
    }
}
