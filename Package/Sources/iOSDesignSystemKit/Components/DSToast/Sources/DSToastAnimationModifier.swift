import SwiftUI

// MARK: - DSToastAnimationModifier

private struct DSToastAnimationModifier<Toast>: ViewModifier where Toast: View {
    // MARK: Lifecycle

    init(
        isPresented: Binding<Bool>,
        dismiss: DSToastDismissalMode,
        @ViewBuilder toastView: @escaping () -> Toast
    ) {
        _isPresented = isPresented
        self.toastView = toastView()
        self.dismiss = dismiss
    }

    // MARK: Internal

    func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                if isPresented {
                    Spacer()
                    toastView
                        .task(priority: .userInitiated) {
                            if let dismissAfter {
                                try? await sleep(for: dismissAfter)
                                isPresented = false
                            }
                        }
                        .transition(.asymmetric(
                            insertion: .push(from: .bottom).combined(with: .scale(scale: 0.8)),
                            removal: .push(from: .top)
                        ))
                }
            }
            .animation(.easeInOut(duration: 0.2), value: isPresented)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    // MARK: Private

    @Binding private var isPresented: Bool
    private let toastView: Toast
    private let dismiss: DSToastDismissalMode

    private var dismissAfter: TimeInterval? {
        switch dismiss {
        case .auto: .systemDismissal
        case .never: nil
        case let .timeInterval(time): time
        }
    }

    private func sleep(for seconds: TimeInterval) async throws {
        if #available(iOS 16.0, *) {
            try await Task.sleep(for: .seconds(seconds))
        } else {
            try await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
        }
    }
}

private extension TimeInterval {
    static let systemDismissal: TimeInterval = 3.0
}

// MARK: - View + DSToastAnimationModifier
public extension View {
    /// Presents a toast when a `isPresented` binded value that you provide is `true`.
    ///
    /// ## Usage example:
    ///
    ///        Button("Toggle presentation") {
    ///            isPresented.toggle()
    ///        }
    ///        .dsToast(isPresented: $isPresented, dismissAfter: .never) {
    ///            DSToast(
    ///                title: {
    ///                    Text("Success: Success Message")
    ///                },
    ///                illustration: {
    ///                    IconToken.success.swiftUIImage.frame(width: .size_24pt, height: .size_24pt)
    ///                },
    ///                button: {
    ///                    Button(action: {
    ///                        isPresented.toggle()
    ///                    }, label: {
    ///                        IconToken.cross.swiftUIImage
    ///                    })
    ///                }
    ///            )
    ///        }
    ///
    /// - Parameters:
    ///   - isPresented: A binding to an any Boolean value that determines whether to present the toast that you create in the modifier's `content` closure.
    ///   - dismissAfter: ``DSToastDismissalMode`` which determines rules of toast dismiss.
    ///   - content: `ViewBuilder` closure that return toast view. Recommended to use ``DSToastView``, but if needed you can use any custom view.
    func dsToast<Toast>(
        isPresented: Binding<Bool>,
        dismissAfter: DSToastDismissalMode = .auto,
        @ViewBuilder content: @escaping () -> Toast
    ) -> some View where Toast: View {
        modifier(
            DSToastAnimationModifier(
                isPresented: isPresented,
                dismiss: dismissAfter,
                toastView: content
            )
        )
    }
}
