import Foundation

/// Static, deterministic project list — no backend. Mirrors the portfolio
/// section shown on the Next.js, Compose Multiplatform, and Android
/// showcase siblings.
struct PortfolioMockGenerator {
    static func generate() -> [PortfolioItem] {
        [
            PortfolioItem(
                id: "showcase-ios",
                title: "Showcase.iOS",
                subtitle: "This app's own source — native SwiftUI, MVVM, and Clean Architecture.",
                tags: ["Swift", "SwiftUI", "MVVM"],
                url: URL(string: "https://github.com/Artificialss/Showcase.iOS")!
            ),
            PortfolioItem(
                id: "showcase-android",
                title: "Showcase.Android",
                subtitle: "Native Kotlin, Jetpack Compose, MVVM, and Clean Architecture with Koin.",
                tags: ["Kotlin", "Jetpack Compose", "MVVM"],
                url: URL(string: "https://github.com/Artificialss/Showcase.Android")!
            ),
            PortfolioItem(
                id: "showcase-cmm",
                title: "Showcase.CMM",
                subtitle: "Compose Multiplatform showcase app for Android & iOS — MVP architecture, custom Canvas charts.",
                tags: ["Kotlin", "Compose Multiplatform", "MVP"],
                url: URL(string: "https://github.com/Artificialss/Showcase.CMM")!
            ),
            PortfolioItem(
                id: "showcase-nextjs",
                title: "Showcase.NextJS",
                subtitle: "A standalone Next.js landing page adapted from our real design system.",
                tags: ["Next.js", "TypeScript", "Tailwind"],
                url: URL(string: "https://github.com/Artificialss/Showcase.NextJS")!
            ),
            PortfolioItem(
                id: "papasar",
                title: "Papasar",
                subtitle: "AI-powered study platform helping students prepare for exams with adaptive question sets.",
                tags: ["Product", "AI", "Education"],
                url: URL(string: "https://papasar.cr")!
            ),
            PortfolioItem(
                id: "artificialss-ai",
                title: "Artificialss.ai",
                subtitle: "Our main website — software development, legal advisory, and AI training services.",
                tags: ["Next.js", "Firebase", "i18n"],
                url: URL(string: "https://artificialss.ai")!
            ),
        ]
    }
}
