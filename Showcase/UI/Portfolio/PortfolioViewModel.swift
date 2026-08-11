import Foundation
import Observation

@Observable
@MainActor
final class PortfolioViewModel {
    private(set) var items: [PortfolioItem] = []

    private let getPortfolioItems: GetPortfolioItemsUseCase

    init(getPortfolioItems: GetPortfolioItemsUseCase) {
        self.getPortfolioItems = getPortfolioItems
        items = getPortfolioItems.execute()
    }
}
