import CoreFoundation

// MARK: - Size assets declaration

public extension CGFloat {
    // MARK: - Tokens declaration

    /// **x1** size constant describing the frame of an element and equal to **4 pt**.
    ///
    /// Can be used to define element `width`, `height`, etc... .
    ///
    static let size_4pt: CGFloat = 4

    /// **x2** size constant describing the frame of an element and equal to **8 pt**.
    ///
    /// Can be used to define element `width`, `height`, etc... .
    ///
    static let size_8pt: CGFloat = 8

    /// **x3** size constant describing the frame of an element and equal to **12 pt**.
    ///
    /// Can be used to define element `width`, `height`, etc... .
    ///
    static let size_12pt: CGFloat = 12

    /// **x4** size constant describing the frame of an element and equal to **16 pt**.
    ///
    /// Can be used to define element `width`, `height`, etc... .
    ///
    static let size_16pt: CGFloat = 16

    /// **x5** size constant describing the frame of an element and equal to **20 pt**.
    ///
    /// Can be used to define element `width`, `height`, etc... .
    ///
    static let size_20pt: CGFloat = 20

    /// **x6** size constant describing the frame of an element and equal to **24 pt**.
    ///
    /// Can be used to define element `width`, `height`, etc... .
    ///
    static let size_24pt: CGFloat = 24
}

// MARK: - all for SizeToken

public extension CGFloat {
    static let allSizeTokens: [CGFloat] = [.size_4pt, .size_8pt, .size_12pt, .size_16pt, .size_20pt, .size_24pt]
}

// MARK: - Space assets declaration

public extension CGFloat {
    // MARK: - Tokens declaration

    /// **x1** spacing constant describing space between or around elements and equal to **4 pt**.
    ///
    /// Can be used for `padding`, ``HStack`` or ``VStack`` spacing, `offset`, ``Spacer`` size etc... .
    ///
    static let space_4pt: CGFloat = 4

    /// **x2** spacing constant describing space between or around elements and equal to **8 pt**.
    ///
    /// Can be used for `padding`, ``HStack`` or ``VStack`` spacing, `offset`, ``Spacer`` size etc... .
    ///
    static let space_8pt: CGFloat = 8

    /// **x3** spacing constant describing space between or around elements and equal to **12 pt**.
    ///
    /// Can be used for `padding`, ``HStack`` or ``VStack`` spacing, `offset`, ``Spacer`` size etc... .
    ///
    static let space_12pt: CGFloat = 12

    /// **x4** spacing constant describing space between or around elements and equal to **16 pt**.
    ///
    /// Can be used for `padding`, ``HStack`` or ``VStack`` spacing, `offset`, ``Spacer`` size etc... .
    ///
    static let space_16pt: CGFloat = 16

    /// **x5** spacing constant describing space between or around elements and equal to **20 pt**.
    ///
    /// Can be used for `padding`, ``HStack`` or ``VStack`` spacing, `offset`, ``Spacer`` size etc... .
    ///
    static let space_20pt: CGFloat = 20

    /// **x6** spacing constant describing space between or around elements and equal to **24 pt**.
    ///
    /// Can be used for `padding`, ``HStack`` or ``VStack`` spacing, `offset`, ``Spacer`` size etc... .
    ///
    static let space_24pt: CGFloat = 24
}

// MARK: - all for SpaceToken

public extension CGFloat {
    static let allSpaceTokens: [CGFloat] = [.space_4pt, .space_8pt, .space_12pt, .space_16pt, .space_20pt, .space_24pt]
}
