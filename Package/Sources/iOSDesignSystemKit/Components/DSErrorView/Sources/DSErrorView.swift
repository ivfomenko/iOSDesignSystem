//
//  DSErrorView.swift
//  iOSDesignSystemKit
//
//  Created by Ivan Fomenko on 11.12.2024.
//

import SwiftUI

// MARK: - DSErrorView

public struct DSErrorView<Title: View, Subtitle: View, Illustration: View, Button: View>: View {
    private let title: Title
    private let subtitle: Subtitle
    private let illustration: Illustration
    private let button: Button

    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder illustration: @escaping () -> Illustration,
        @ViewBuilder button: @escaping () -> Button
    ) {
        self.title = title()
        self.subtitle = subtitle()
        self.illustration = illustration()
        self.button = button()
    }

    public var body: some View {
        VStack(spacing: .space_16pt) {
            Spacer()

            iconView

            VStack(spacing: .space_8pt) {
                titleLabel
                subtitleLabel
            }

            Spacer()
            retryButton
        }
        .padding()
    }

    @ViewBuilder
    private var titleLabel: some View {
        title
            .font(.title)
            .foregroundStyle(Color.monoPrimary)
            .lineLimit(1)
    }

    @ViewBuilder
    private var subtitleLabel: some View {
        subtitle
            .font(.subheadline)
            .foregroundStyle(Color.monoPrimary)
            .lineLimit(3)
    }

    @ViewBuilder
    private var iconView: some View {
        HStack {
            Spacer()
            illustration
                .frame(width: 96.0, height: 96.0)
                .foregroundStyle(Color.monoPrimary)
            Spacer()
        }
    }

    @ViewBuilder
    private var retryButton: some View {
        button
            .font(.subheadline)
            .foregroundStyle(Color.white)
            .background(RoundedRectangle(cornerRadius: .zero).fill(Color.monoPrimary))
    }
}

// MARK: - DSErrorView + inits

public extension DSErrorView {
    init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder button: @escaping () -> Button
    ) where Illustration == EmptyView {
        self.init(title: title, subtitle: subtitle, illustration: { EmptyView() }, button: button)
    }

    /// - Parameters:
    ///   - illustration: Abstract `View` for `Illustration` position. Will be limited with `.frame(width: 96.0, height: 96.0)` size based on DS requirements
    init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder illustration: @escaping () -> Illustration,
        @ViewBuilder button: @escaping () -> Button
    ) where Subtitle == EmptyView {
        self.init(title: title, subtitle: { EmptyView() }, illustration: illustration, button: button)
    }
}

// MARK: - Preview

#Preview {
    DSErrorView(
        title: {
            VStack(spacing: .space_12pt) {
                Text("Something went wrong")
                    .accessibilityLabel("accessibilityLabel")
                    .accessibilityIdentifier("accessibilityIdentifier")

                Text("We're working on it")
                    .font(.subheadline)
                    .foregroundStyle(Color.monoSecondary)
                    .lineLimit(3)
                    .accessibilityLabel("accessibilityLabel")
                    .accessibilityIdentifier("accessibilityIdentifier")
            }
        },
        illustration: {
            IconToken.illustration
                .swiftUIImage
                .resizable()
                .accessibilityLabel("accessibilityLabel")
                .accessibilityIdentifier("accessibilityIdentifier")
        },
        button: {
            Button(action: {
                print("fakse")
            }) {
                Text("Retry")
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .accessibilityLabel("accessibilityLabel")
            .accessibilityIdentifier("accessibilityIdentifier")
        }
    )
}
