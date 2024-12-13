#if os(macOS)
    import AppKit
#elseif os(iOS)
    import UIKit
#elseif os(tvOS) || os(watchOS)
    import UIKit
#endif
#if canImport(SwiftUI)
    import SwiftUI
#endif

// MARK: - IconTokens listing

/// Automatically generated and tokenised objects for public usage
public extension IconToken {
    // MARK: - Regular icon types

    static let regular_back = IconToken(name: "back_regular")
    static let regular_close = IconToken(name: "close_regular")
    static let regular_error = IconToken(name: "error_regular")
}

// MARK: - All IconTokens tokens

public extension IconToken {
    static let allRegularTokens: [IconToken] = [
        .regular_back,
        .regular_close,
        .regular_error,
    ]
}
