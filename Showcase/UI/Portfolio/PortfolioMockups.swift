import SwiftUI

private let iosBlue = Color(red: 0.0, green: 0.478, blue: 1.0)
private let androidGreen = Color(red: 0.239, green: 0.863, blue: 0.518)
private let nextBlack = Color(red: 0.039, green: 0.039, blue: 0.039)
private let papasarPurple = Color(red: 0.486, green: 0.231, blue: 0.929)
private let artificialssTeal = Color(red: 0.204, green: 0.494, blue: 0.404)
private let kotlinGreenDark = Color(red: 0.071, green: 0.227, blue: 0.149)

/// Illustrated per-project mockup, drawn with Canvas — mirrors
/// Showcase.NextJS's SVG mockups and Showcase.Android's Compose Canvas
/// versions.
struct PortfolioMockupView: View {
    let id: String

    var body: some View {
        Canvas { context, size in
            switch id {
            case "showcase-ios":
                drawIOSMockup(context: context, size: size)
            case "showcase-android":
                drawAndroidMockup(context: context, size: size)
            case "showcase-cmm":
                drawCmmMockup(context: context, size: size)
            case "showcase-nextjs":
                drawNextjsMockup(context: context, size: size)
            case "papasar":
                drawPapasarMockup(context: context, size: size)
            default:
                drawArtificialssMockup(context: context, size: size)
            }
        }
    }

    private func drawIOSMockup(context: GraphicsContext, size: CGSize) {
        context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(Color(white: 0.04)))

        let frameWidth = size.width * 0.34
        let frameLeft = (size.width - frameWidth) / 2
        let frameTop = size.height * 0.08
        let frameHeight = size.height * 0.84
        let frame = CGRect(x: frameLeft, y: frameTop, width: frameWidth, height: frameHeight)
        context.fill(Path(roundedRect: frame, cornerRadius: 24), with: .color(Color(white: 0.12)))

        let padding = frameWidth * 0.12
        context.fill(
            Path(roundedRect: CGRect(x: frameLeft + padding, y: frameTop + padding * 1.5, width: frameWidth - padding * 2, height: frameHeight * 0.18), cornerRadius: 8),
            with: .color(iosBlue.opacity(0.3))
        )
        context.fill(
            Path(roundedRect: CGRect(x: frameLeft + padding, y: frameTop + frameHeight * 0.32, width: frameWidth - padding * 2, height: frameHeight * 0.28), cornerRadius: 8),
            with: .color(iosBlue.opacity(0.2))
        )

        let navTop = frameTop + frameHeight * 0.82
        context.fill(
            Path(CGRect(x: frameLeft, y: navTop, width: frameWidth, height: frameHeight * 0.18)),
            with: .color(Color(white: 0.08))
        )
        let navCenterY = navTop + frameHeight * 0.09
        context.fill(Path(ellipseIn: CGRect(x: frameLeft + frameWidth * 0.35 - 4, y: navCenterY - 4, width: 8, height: 8)), with: .color(iosBlue))
        context.fill(Path(ellipseIn: CGRect(x: frameLeft + frameWidth * 0.65 - 4, y: navCenterY - 4, width: 8, height: 8)), with: .color(iosBlue.opacity(0.4)))
    }

    private func drawAndroidMockup(context: GraphicsContext, size: CGSize) {
        context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(Color(red: 0.051, green: 0.098, blue: 0.071)))

        let frameWidth = size.width * 0.34
        let frameLeft = (size.width - frameWidth) / 2
        let frameTop = size.height * 0.08
        let frameHeight = size.height * 0.84
        let frame = CGRect(x: frameLeft, y: frameTop, width: frameWidth, height: frameHeight)
        context.fill(Path(roundedRect: frame, cornerRadius: 24), with: .color(kotlinGreenDark))

        let padding = frameWidth * 0.12
        context.fill(
            Path(roundedRect: CGRect(x: frameLeft + padding, y: frameTop + padding * 1.5, width: frameWidth - padding * 2, height: frameHeight * 0.18), cornerRadius: 8),
            with: .color(androidGreen.opacity(0.3))
        )
        context.fill(
            Path(roundedRect: CGRect(x: frameLeft + padding, y: frameTop + frameHeight * 0.32, width: frameWidth - padding * 2, height: frameHeight * 0.28), cornerRadius: 8),
            with: .color(androidGreen.opacity(0.2))
        )

        let navTop = frameTop + frameHeight * 0.82
        context.fill(
            Path(CGRect(x: frameLeft, y: navTop, width: frameWidth, height: frameHeight * 0.18)),
            with: .color(Color(red: 0.039, green: 0.165, blue: 0.106))
        )
        let navCenterY = navTop + frameHeight * 0.09
        context.fill(Path(ellipseIn: CGRect(x: frameLeft + frameWidth * 0.35 - 4, y: navCenterY - 4, width: 8, height: 8)), with: .color(androidGreen))
        context.fill(Path(ellipseIn: CGRect(x: frameLeft + frameWidth * 0.65 - 4, y: navCenterY - 4, width: 8, height: 8)), with: .color(androidGreen.opacity(0.4)))
    }

    private func drawCmmMockup(context: GraphicsContext, size: CGSize) {
        context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(Color(red: 0.051, green: 0.098, blue: 0.071)))
        context.fill(Path(CGRect(x: 0, y: 0, width: size.width, height: size.height * 0.16)), with: .color(kotlinGreenDark))

        let cardWidth = size.width * 0.42
        context.fill(
            Path(roundedRect: CGRect(x: size.width * 0.05, y: size.height * 0.25, width: cardWidth, height: size.height * 0.3), cornerRadius: 10),
            with: .color(kotlinGreenDark)
        )
        context.fill(
            Path(roundedRect: CGRect(x: size.width * 0.53, y: size.height * 0.25, width: cardWidth, height: size.height * 0.3), cornerRadius: 10),
            with: .color(kotlinGreenDark)
        )

        let barHeights: [Double] = [0.3, 0.45, 0.25, 0.55, 0.4, 0.5]
        let barWidth = size.width * 0.1
        for (i, h) in barHeights.enumerated() {
            let barHeight = size.height * 0.25 * h
            let rect = CGRect(
                x: size.width * 0.08 + Double(i) * barWidth * 1.15,
                y: size.height * 0.82 - barHeight,
                width: barWidth,
                height: barHeight
            )
            context.fill(Path(roundedRect: rect, cornerRadius: 3), with: .color(androidGreen.opacity(0.5 + Double(i) * 0.06)))
        }
    }

    private func drawNextjsMockup(context: GraphicsContext, size: CGSize) {
        context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(nextBlack))
        context.fill(Path(CGRect(x: 0, y: 0, width: size.width, height: size.height * 0.14)), with: .color(Color(white: 0.09)))

        let dotColors: [Color] = [.red, .yellow, .green]
        for (i, c) in dotColors.enumerated() {
            let r = size.width * 0.02
            let cx = size.width * (0.08 + Double(i) * 0.07)
            let cy = size.height * 0.07
            context.fill(Path(ellipseIn: CGRect(x: cx - r, y: cy - r, width: r * 2, height: r * 2)), with: .color(c))
        }

        let moonR = size.width * 0.12
        context.fill(
            Path(ellipseIn: CGRect(x: size.width * 0.5 - moonR, y: size.height * 0.5 - moonR, width: moonR * 2, height: moonR * 2)),
            with: .color(androidGreen.opacity(0.85))
        )
        context.fill(
            Path(roundedRect: CGRect(x: size.width * 0.3, y: size.height * 0.78, width: size.width * 0.4, height: size.height * 0.05), cornerRadius: 4),
            with: .color(.white.opacity(0.8))
        )
    }

    private func drawPapasarMockup(context: GraphicsContext, size: CGSize) {
        context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(Color(red: 0.102, green: 0.063, blue: 0.208)))
        context.fill(Path(CGRect(x: 0, y: 0, width: size.width, height: size.height * 0.18)), with: .color(Color(red: 0.176, green: 0.122, blue: 0.369)))

        let rowHeight = size.height * 0.13
        let widths: [Double] = [0.35, 0.55, 0.65, 0.45]
        for (i, _) in widths.enumerated() {
            let y = size.height * 0.3 + Double(i) * rowHeight * 1.1
            let selected = i == 1
            let rect = CGRect(x: size.width * 0.06, y: y, width: size.width * 0.88, height: rowHeight * 0.7)
            context.fill(
                Path(roundedRect: rect, cornerRadius: 8),
                with: .color((selected ? papasarPurple : Color(red: 0.176, green: 0.122, blue: 0.369)).opacity(selected ? 0.9 : 0.5))
            )
        }
    }

    private func drawArtificialssMockup(context: GraphicsContext, size: CGSize) {
        context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(Color(red: 0.047, green: 0.059, blue: 0.078)))
        context.fill(Path(CGRect(x: 0, y: 0, width: size.width, height: size.height * 0.16)), with: .color(Color(red: 0.067, green: 0.094, blue: 0.125)))

        let dotR = size.width * 0.03
        context.fill(
            Path(ellipseIn: CGRect(x: size.width * 0.08 - dotR, y: size.height * 0.08 - dotR, width: dotR * 2, height: dotR * 2)),
            with: .color(artificialssTeal)
        )
        context.fill(
            Path(roundedRect: CGRect(x: size.width * 0.08, y: size.height * 0.25, width: size.width * 0.5, height: size.height * 0.06), cornerRadius: 4),
            with: .color(Color(white: 0.9).opacity(0.7))
        )

        let cardWidth = size.width * 0.26
        for i in 0..<3 {
            let rect = CGRect(x: size.width * 0.08 + Double(i) * cardWidth * 1.05, y: size.height * 0.5, width: cardWidth, height: size.height * 0.35)
            context.fill(Path(roundedRect: rect, cornerRadius: 8), with: .color(Color(white: 0.13)))
        }
    }
}

#Preview {
    PortfolioMockupView(id: "showcase-ios")
        .frame(width: 320, height: 180)
}
