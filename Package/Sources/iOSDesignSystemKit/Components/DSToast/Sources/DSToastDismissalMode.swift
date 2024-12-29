import Foundation

/// The Dismiss mode for ``DSToast``.
public enum DSToastDismissalMode {
    /// 3 seconds until dismissal
    case auto
    ///  ``DSToast`` need to be dismissed manually
    case never
    /// Custom duration in seconds until dismissal
    case timeInterval(TimeInterval)
}
