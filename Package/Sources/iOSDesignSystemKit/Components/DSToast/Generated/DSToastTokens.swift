import SwiftUI

public extension DSToastToken {

    /// ``DSToastToken`` configuration with measurement `normal` and `error` color style.
    static let errorNormal: DSToastToken = .init(
        appearance: .init(
            name: "error",
            background: .init(
                .error
            ),
            foreground: .init(
                .error
            )
        ),
        measurements: .init(
            name: "normal",
            maxSize: 512, 
            minSize: 288, 
            padding: 12, 
            spacing: 12
        )
    )

    /// ``DSToastToken`` configuration with measurement `normal` and `notificatiton` color style.
    static let notificatitonNormal: DSToastToken = .init(
        appearance: .init(
            name: "notificatiton",
            background: .init(
                .notification
            ),
            foreground: .init(
                .notification
            )
        ),
        measurements: .init(
            name: "normal",
            maxSize: 512, 
            minSize: 288, 
            padding: 12, 
            spacing: 12
        )
    )

    /// ``DSToastToken`` configuration with measurement `normal` and `success` color style.
    static let successNormal: DSToastToken = .init(
        appearance: .init(
            name: "success",
            background: .init(
                .success
            ),
            foreground: .init(
                .success
            )
        ),
        measurements: .init(
            name: "normal",
            maxSize: 512, 
            minSize: 288, 
            padding: 12, 
            spacing: 12
        )
    )
}

