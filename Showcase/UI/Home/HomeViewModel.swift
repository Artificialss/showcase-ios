import Foundation
import Observation

@Observable
@MainActor
final class HomeViewModel {
    let ctaUrl = URL(string: "https://artificialss.ai/portfolio")!
}
