import SwiftUI

private struct Star {
    let x: Double
    let y: Double
    let radius: Double
    let phaseOffset: Double
}

private let starCount = 90
private let spaceBlack = Color(red: 0.02, green: 0.027, blue: 0.051)

/// Full-bleed black sky with gently twinkling stars — sits behind the
/// Portfolio screen's content.
struct SpaceBackgroundView: View {
    private let stars: [Star] = {
        var generator = SeededGenerator(seed: 7)
        return (0..<starCount).map { _ in
            Star(
                x: Double.random(in: 0...1, using: &generator),
                y: Double.random(in: 0...1, using: &generator),
                radius: Double.random(in: 0.6...2.4, using: &generator),
                phaseOffset: Double.random(in: 0...(2 * .pi), using: &generator)
            )
        }
    }()

    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(spaceBlack))

                let time = timeline.date.timeIntervalSinceReferenceDate
                for star in stars {
                    let twinkle = (sin(time + star.phaseOffset) + 1) / 2
                    let alpha = 0.25 + twinkle * 0.65
                    let rect = CGRect(
                        x: star.x * size.width - star.radius,
                        y: star.y * size.height - star.radius,
                        width: star.radius * 2,
                        height: star.radius * 2
                    )
                    context.fill(Path(ellipseIn: rect), with: .color(.white.opacity(alpha)))
                }
            }
        }
        .ignoresSafeArea()
    }
}

/// Deterministic PRNG so the star field is stable across launches.
private struct SeededGenerator: RandomNumberGenerator {
    private var state: UInt64

    init(seed: UInt64) {
        state = seed == 0 ? 0xDEADBEEF : seed
    }

    mutating func next() -> UInt64 {
        state ^= state << 13
        state ^= state >> 7
        state ^= state << 17
        return state
    }
}

#Preview {
    SpaceBackgroundView()
}
