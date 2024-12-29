import SwiftUI

public struct DSToastToken: Sendable {
    // MARK: Lifecycle

    init(appearance: Appearance, measurements: Measurements) {
        id = "\(appearance.name)_\(measurements.name)"
        self.measurements = measurements
        self.appearance = appearance
    }

    // MARK: Public

    /// Public string identified for ``DSToastToken``.
    ///
    /// Id struct: `\(appearance.name)_\(measurements.name)`
    public let id: String
    public let measurements: Measurements
    public let appearance: Appearance
}

// MARK: - DSToastToken

public extension DSToastToken {
    struct Measurements: Sendable {
        // MARK: Lifecycle

        init(
            name: String,
            maxSize: CGFloat,
            minSize: CGFloat,
            padding: CGFloat,
            spacing: CGFloat
        ) {
            self.name = name
            self.minSize = minSize
            self.maxSize = maxSize
            self.spacing = spacing
            self.padding = padding
        }

        // MARK: Public

        public let minSize: CGFloat
        public let maxSize: CGFloat
        public let spacing: CGFloat
        public let padding: CGFloat

        // MARK: Internal

        let name: String
    }
}

// MARK: - Appearance

public extension DSToastToken {
    struct Appearance: Sendable {
        // MARK: Lifecycle

        init(name: String, background: Color, foreground: Color) {
            self.name = name
            self.background = background
            self.foreground = foreground
        }

        // MARK: Public

        public let background: Color
        public let foreground: Color

        // MARK: Internal

        let name: String
    }
}
