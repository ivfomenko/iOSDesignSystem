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

    static let arrow_Left = IconToken(name: "Arrow Left")
    static let bar_Chart = IconToken(name: "Bar Chart")
    static let bell = IconToken(name: "Bell")
    static let calendar = IconToken(name: "Calendar")
    static let chat = IconToken(name: "Chat")
    static let credit_Card = IconToken(name: "Credit Card")
    static let cross = IconToken(name: "Cross")
    static let download = IconToken(name: "Download")
    static let dropdown = IconToken(name: "Dropdown")
    static let edit = IconToken(name: "Edit")
    static let error = IconToken(name: "Error")
    static let filter = IconToken(name: "Filter")
    static let help = IconToken(name: "Help")
    static let home = IconToken(name: "Home")
    static let illustration = IconToken(name: "Illustration")
    static let inbox = IconToken(name: "Inbox")
    static let map = IconToken(name: "Map")
    static let menu = IconToken(name: "Menu")
    static let pin = IconToken(name: "Pin")
    static let search = IconToken(name: "Search")
    static let share = IconToken(name: "Share")
    static let star = IconToken(name: "Star")
    static let success = IconToken(name: "Success")
    static let user = IconToken(name: "User")
    static let zap = IconToken(name: "Zap")
}

// MARK: - All IconTokens tokens

public extension IconToken {
    static let allRegularTokens: [IconToken] = [
        .arrow_Left, .bar_Chart, .bell, .calendar, .chat, .credit_Card, .cross, .download, .dropdown, .edit, .error, .filter, .help, .home, .illustration, .inbox, .map, .menu, .pin, .search, .share, .star, .success, .user, .zap,
    ]
}
