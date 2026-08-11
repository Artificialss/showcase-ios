import SwiftUI
import UIKit

/// Brand palette ported from the real site's HSL design tokens (see
/// Showcase.NextJS's globals.css and Showcase.Android's Color.kt) — same
/// colors, no backend. Each color adapts automatically to light/dark mode.
enum BrandColors {
    static let background = adaptive(light: 0xF6EFEA, dark: 0x1D1916)
    static let foreground = adaptive(light: 0x42352E, dark: 0xF8FAFC)
    static let card = adaptive(light: 0xFFFFFF, dark: 0x2B2621)
    static let cardForeground = foreground
    static let primary = adaptive(light: 0x357E63, dark: 0x44A27F)
    static let primaryForeground = adaptive(light: 0xFAFAFA, dark: 0xFAFAFA)
    static let secondary = adaptive(light: 0x82357C, dark: 0x5F3A5C)
    static let muted = adaptive(light: 0xE9DFD8, dark: 0x3F273D)
    static let mutedForeground = adaptive(light: 0x958075, dark: 0xA1A1AA)
    static let accent = adaptive(light: 0xF85E12, dark: 0xF97939)
    static let border = adaptive(light: 0xDBD0C7, dark: 0x3A322C)

    private static func adaptive(light: UInt32, dark: UInt32) -> Color {
        Color(UIColor { traits in
            traits.userInterfaceStyle == .dark ? UIColor(hex: dark) : UIColor(hex: light)
        })
    }
}

private extension UIColor {
    convenience init(hex: UInt32) {
        let r = CGFloat((hex >> 16) & 0xFF) / 255
        let g = CGFloat((hex >> 8) & 0xFF) / 255
        let b = CGFloat(hex & 0xFF) / 255
        self.init(red: r, green: g, blue: b, alpha: 1)
    }
}
