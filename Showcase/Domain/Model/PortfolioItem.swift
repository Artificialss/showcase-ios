import Foundation

struct PortfolioItem: Identifiable, Equatable {
    let id: String
    let title: String
    let subtitle: String
    let tags: [String]
    let url: URL
}
