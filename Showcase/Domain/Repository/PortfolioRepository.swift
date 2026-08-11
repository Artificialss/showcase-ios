import Foundation

protocol PortfolioRepository {
    func getPortfolioItems() -> [PortfolioItem]
}
