import Foundation

struct PortfolioRepositoryImpl: PortfolioRepository {
    func getPortfolioItems() -> [PortfolioItem] {
        PortfolioMockGenerator.generate()
    }
}
