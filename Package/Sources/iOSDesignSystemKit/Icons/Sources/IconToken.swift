//
//  IconToken.swift
//  iOSDesignSystemKit
//
//  Created by Ivan Fomenko on 11.12.2024.
//

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

/// Icon `AssetObject`, not for usage
public struct IconToken: Sendable, Equatable {
    fileprivate(set) var name: String

    #if os(macOS)
        public typealias Image = NSImage
    #elseif os(iOS) || os(tvOS) || os(watchOS)
        public typealias Image = UIImage
    #endif

    @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
    public var image: Image {
        let bundle = BundleToken.bundle
        #if os(iOS) || os(tvOS)
            let image = Image(named: name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
            let name = NSImage.Name(self.name)
            let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
        #elseif os(watchOS)
            let image = Image(named: name)
        #endif
        guard let result = image else {
            fatalError("Unable to load image asset named \(name).")
        }
        return result
    }

    #if os(iOS) || os(tvOS)
        @available(iOS 8.0, tvOS 9.0, *)
        public func image(compatibleWith traitCollection: UITraitCollection) -> Image {
            let bundle = BundleToken.bundle
            guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
                fatalError("Unable to load image asset named \(name).")
            }
            return result
        }
    #endif

    #if canImport(SwiftUI)
        @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
        public var swiftUIImage: SwiftUI.Image {
            SwiftUI.Image(token: self)
        }
    #endif
}

extension IconToken.Image {
    @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
    @available(macOS, deprecated,
               message: "This initializer is unsafe on macOS, please use the IconAsset.image property")
    convenience init?(token: IconToken) {
        #if os(iOS) || os(tvOS)
            let bundle = BundleToken.bundle
            self.init(named: token.name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
            self.init(named: NSImage.Name(token.name))
        #elseif os(watchOS)
            self.init(named: token.name)
        #endif
    }
}

#if canImport(SwiftUI)
    extension IconToken: Identifiable {
        public typealias ID = String
        public var id: String {
            return name
        }
    }
#endif
#if canImport(SwiftUI)
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    extension SwiftUI.Image {
        init(token: IconToken) {
            let bundle = BundleToken.bundle
            self.init(token.name, bundle: bundle)
        }

        init(token: IconToken, label: Text) {
            let bundle = BundleToken.bundle
            self.init(token.name, bundle: bundle, label: label)
        }

        init(decorative token: IconToken) {
            let bundle = BundleToken.bundle
            self.init(decorative: token.name, bundle: bundle)
        }
    }
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
    static let bundle: Bundle = {
        #if SWIFT_PACKAGE
            return Bundle.module
        #else
            return Bundle(for: BundleToken.self)
        #endif
    }()
}

// swiftlint:enable convenience_type
