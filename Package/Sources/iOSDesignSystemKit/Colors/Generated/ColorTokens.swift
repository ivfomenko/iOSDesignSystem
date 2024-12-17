#if os(iOS)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif


// swiftlint:disable identifier_name line_length nesting type_body_length type_name
// MARK: - UIColor Catalog

extension UIColor {

/// DesignSystem token representation in UIKit.UIColor
public static let alternative: UIColor = .init(named: "alternative", in: .module, compatibleWith: nil)!
/// DesignSystem token representation in UIKit.UIColor
public static let error: UIColor = .init(named: "error", in: .module, compatibleWith: nil)!
/// DesignSystem token representation in UIKit.UIColor
public static let highlight: UIColor = .init(named: "highlight", in: .module, compatibleWith: nil)!
/// DesignSystem token representation in UIKit.UIColor
public static let monoOnContent: UIColor = .init(named: "monoOnContent", in: .module, compatibleWith: nil)!
/// DesignSystem token representation in UIKit.UIColor
public static let monoPrimary: UIColor = .init(named: "monoPrimary", in: .module, compatibleWith: nil)!
/// DesignSystem token representation in UIKit.UIColor
public static let monoSecondary: UIColor = .init(named: "monoSecondary", in: .module, compatibleWith: nil)!
/// DesignSystem token representation in UIKit.UIColor
public static let notificaiton: UIColor = .init(named: "notificaiton", in: .module, compatibleWith: nil)!
/// DesignSystem token representation in UIKit.UIColor
public static let primary: UIColor = .init(named: "primary", in: .module, compatibleWith: nil)!
/// DesignSystem token representation in UIKit.UIColor
public static let success: UIColor = .init(named: "success", in: .module, compatibleWith: nil)!
}

// MARK: - all for UIColor

public extension UIColor {
static let allColors: [UIColor] = [.alternative, .error, .highlight, .monoOnContent, .monoPrimary, .monoSecondary, .notificaiton, .primary, .success]
}

#if canImport(SwiftUI)
// MARK: - SwiftUI.Color Catalog

extension SwiftUI.Color {

/// DesignSystem token representation in SwiftUI.Color
public static let alternative: SwiftUI.Color = .init("alternative", bundle: .module)
/// DesignSystem token representation in SwiftUI.Color
public static let error: SwiftUI.Color = .init("error", bundle: .module)
/// DesignSystem token representation in SwiftUI.Color
public static let highlight: SwiftUI.Color = .init("highlight", bundle: .module)
/// DesignSystem token representation in SwiftUI.Color
public static let monoOnContent: SwiftUI.Color = .init("monoOnContent", bundle: .module)
/// DesignSystem token representation in SwiftUI.Color
public static let monoPrimary: SwiftUI.Color = .init("monoPrimary", bundle: .module)
/// DesignSystem token representation in SwiftUI.Color
public static let monoSecondary: SwiftUI.Color = .init("monoSecondary", bundle: .module)
/// DesignSystem token representation in SwiftUI.Color
public static let notificaiton: SwiftUI.Color = .init("notificaiton", bundle: .module)
/// DesignSystem token representation in SwiftUI.Color
public static let primary: SwiftUI.Color = .init("primary", bundle: .module)
/// DesignSystem token representation in SwiftUI.Color
public static let success: SwiftUI.Color = .init("success", bundle: .module)
}

// MARK: - all for SwiftUI.Color

public extension SwiftUI.Color {
static let allColors: [SwiftUI.Color] = [.alternative, .error, .highlight, .monoOnContent, .monoPrimary, .monoSecondary, .notificaiton, .primary, .success]
}

#endif

