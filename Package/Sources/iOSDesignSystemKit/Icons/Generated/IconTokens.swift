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
extension IconToken {
    // MARK: - Regular icon types
    public static let arrow_Left = IconToken(name: "Arrow Left")
    public static let bar_Chart = IconToken(name: "Bar Chart")
    public static let bell = IconToken(name: "Bell")
    public static let calendar = IconToken(name: "Calendar")
    public static let chat = IconToken(name: "Chat")
    public static let credit_Card = IconToken(name: "Credit Card")
    public static let cross = IconToken(name: "Cross")
    public static let download = IconToken(name: "Download")
    public static let dropdown = IconToken(name: "Dropdown")
    public static let edit = IconToken(name: "Edit")
    public static let error = IconToken(name: "Error")
    public static let filter = IconToken(name: "Filter")
    public static let help = IconToken(name: "Help")
    public static let home = IconToken(name: "Home")
    public static let illustration = IconToken(name: "Illustration")
    public static let inbox = IconToken(name: "Inbox")
    public static let map = IconToken(name: "Map")
    public static let menu = IconToken(name: "Menu")
    public static let pin = IconToken(name: "Pin")
    public static let search = IconToken(name: "Search")
    public static let share = IconToken(name: "Share")
    public static let star = IconToken(name: "Star")
    public static let success = IconToken(name: "Success")
    public static let user = IconToken(name: "User")
    public static let zap = IconToken(name: "Zap")
}
// MARK: - All IconTokens tokens
extension IconToken {
    public static let allRegularTokens: [IconToken] = [
         .arrow_Left, .bar_Chart, .bell, .calendar, .chat, .credit_Card, .cross, .download, .dropdown, .edit, .error, .filter, .help, .home, .illustration, .inbox, .map, .menu, .pin, .search, .share, .star, .success, .user, .zap
    ]
}
