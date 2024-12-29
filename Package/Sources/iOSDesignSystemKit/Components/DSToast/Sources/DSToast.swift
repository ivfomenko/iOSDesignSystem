import SwiftUI

// MARK: - DSToast

public struct DSToast<Title, Illustration, Button>: View where Title: View, Illustration: View, Button: View {
    // MARK: Lifecycle

    /// Create your own ``DSToast`` with title, illustration and action button using available public API.
    ///
    ///  ## View will have next struct:
    ///
    ///  **| illustration | title | Spacer() | button |**
    ///
    ///  ## Usage:
    ///         DSToast(
    ///             title: {
    ///                 Text("Success: Success Message")
    ///             },
    ///             illustration: {
    ///                 IconToken.success.swiftUIImage.frame(width: .size_24pt, height: .size_24pt)
    ///             },
    ///             button: {
    ///                 Button(action: {
    ///                     // action
    ///                 }, label: {
    ///                     IconToken.cross.swiftUIImage
    ///                 })
    ///             }
    ///         )
    ///
    ///
    ///
    /// - Parameters:
    ///   - title: View slot for Toast message in the view center. Recommended to use ``Text``, but you can also use any custom view if needed. Will be affected by ``DSToastToken/Appearance-swift.struct/foreground`` and `.font(.caption)`. Apply your custom settings in declaration if needed.
    ///   - illustration: View slot for Toast icon or illustration in left corner. Recommended to use ``IconToken/swiftUIImage``, but also custom view or illustration can be used too. Will be affected by `.frame(width: .size_24pt, height: .size_24pt)` and ``DSToastToken/Appearance-swift.struct/foreground``. Apply your custom settings in declaration if needed.
    ///   - button: View slot for Toast action button in right corner. Recommented to use ``Button``, but you can also use any custom view if needed. Will be affected by `.frame(width: .size_24pt, height: .size_24pt)` and hardcoded color `.monoPrimary`. Apply your custom settings in declaration if needed.
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder illustration: @escaping () -> Illustration,
        @ViewBuilder button: @escaping () -> Button
    ) {
        self.title = title()
        self.illustration = illustration()
        self.button = button()
    }

    // MARK: Public

    public var body: some View {
        HStack(alignment: .center, spacing: componentToken.measurements.spacing) {
            illustrationView
            titleLabel
            Spacer(minLength: 0)
            actionView
        }
        .padding(componentToken.measurements.padding)
        .background(componentToken.appearance.background.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: .size_8pt, style: .continuous))
        .frame(minWidth: componentToken.measurements.minSize, maxWidth: componentToken.measurements.maxSize)
        .padding(.bottom, 48)
        .padding(.horizontal, .space_20pt)
    }

    // MARK: Private

    // - Inits
    private let title: Title
    private let illustration: Illustration
    private let button: Button

    // - Environment
    @Environment(\.toastToken) private var componentToken

    @ViewBuilder private var titleLabel: some View {
        title
            .font(.caption)
            .foregroundStyle(componentToken.appearance.foreground)
            .lineLimit(3)
    }

    @ViewBuilder private var illustrationView: some View {
        illustration
            .frame(width: .size_24pt, height: .size_24pt)
            .foregroundStyle(componentToken.appearance.foreground)
    }

    @ViewBuilder private var actionView: some View {
        button
            .frame(width: .size_24pt, height: .size_24pt)
            .foregroundStyle(Color.monoPrimary)
    }
}

// MARK: - DSToast+Inits

public extension DSToast {
    /// Create your own ``DSToast`` with title and illustration using available public API.
    ///
    ///  ## View will have next struct:
    ///
    ///  **| illustration | title | Spacer()|**
    ///
    ///  ## Usage:
    ///
    ///         DSToast(
    ///             title: {
    ///                 Text("Success: Success Message")
    ///             },
    ///             illustration: {
    ///                 IconToken.success.swiftUIImage.frame(width: .size_24pt, height: .size_24pt)
    ///             }
    ///         )
    ///
    /// - Parameters:
    ///   - title: View slot for Toast message in the view center. Recommended to use ``Text``, but you can also use any custom view if needed. Will be affected by ``DSToastToken/Appearance-swift.struct/foreground`` and `.font(.caption)`. Apply your custom settings in declaration if needed.
    ///   - illustration: View slot for Toast icon or illustration in left corner. Recommended to use ``IconToken/swiftUIImage``, but also custom view or illustration can be used too. Will be affected by `.frame(width: .size_24pt, height: .size_24pt)` and ``DSToastToken/Appearance-swift.struct/foreground``. Apply your custom settings in declaration if needed.
    init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder illustration: @escaping () -> Illustration
    ) where Button == EmptyView {
        self.init(title: title, illustration: illustration, button: { EmptyView() })
    }
}

// MARK: - EnvironmentValues

private extension EnvironmentValues {
    @Entry var toastToken: DSToastToken = .successNormal
}

public extension DSToast {
    /// Set ``DSToastToken`` to all ``DSToast`` child views
    func token(_ token: DSToastToken) -> some View {
        environment(\.toastToken, token)
    }
}

public extension View {
    /// Set ``DSToastToken`` to all ``DSToast`` child views
    func toastToken(_ token: DSToastToken) -> some View {
        environment(\.toastToken, token)
    }
}
