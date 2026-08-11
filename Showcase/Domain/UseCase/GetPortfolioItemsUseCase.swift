import Foundation

struct GetPortfolioItemsUseCase {
    private let repository: PortfolioRepository

    init(repository: PortfolioRepository) {
        self.repository = repository
    }

    func execute() -> [PortfolioItem] {
        repository.getPortfolioItems()
    }
}
