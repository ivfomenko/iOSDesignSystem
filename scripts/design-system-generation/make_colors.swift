import Foundation

// MARK: - MAIN

let sourceFileURL = URL(fileURLWithPath: "Package/Sources/iOSDesignSystemKit/Colors/Resources/color_tokens.json")
let destinationFolder = URL(fileURLWithPath: "Package/Sources/iOSDesignSystemKit/Colors/Generated/ColorTokens.xcassets")
// delete old directory, to install only actual colors
_ = shell("rm -r \(destinationFolder)")
if let colorAssets = parseSourceFile(url: sourceFileURL) {
    saveAsColorSet(colorAssets, xcassetsFolderURL: destinationFolder)
    print("Color tokens installed! ✅ ")
} else {
    print("Color tokens resources installation failed 🚫")
    exit(1)
}

// MARK: - Utilites

func shell(_ command: String) -> String {
    let task = Process()
    let pipe = Pipe()

    task.standardOutput = pipe
    task.standardError = pipe
    task.arguments = ["-c", command]
    task.launchPath = "/bin/zsh"
    task.standardInput = nil
    task.launch()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8) ?? ""

    return output
}

extension String {
    var lowercasingFirst: String { prefix(1).lowercased() + dropFirst() }
    var uppercasingFirst: String { prefix(1).uppercased() + dropFirst() }

    var camelCased: String {
        guard !isEmpty else { return "" }
        let parts = components(separatedBy: .alphanumerics.inverted)
        let first = parts.first!.lowercasingFirst
        let rest = parts.dropFirst().map { $0.uppercasingFirst }

        return ([first] + rest).joined()
    }
}

struct ColorSetContents: Encodable {
    let colors: [ColorSetColorConfiguration]
    let info = ColorSetContentsInfo()
}

struct ColorSetContentsInfo: Encodable {
    let author = "xcode"
    let version = 1
}

struct ColorSetColorConfiguration: Encodable {
    let idiom = ColorSetIdiom.universal
    let color: ColorSetColor
    let appearances: [ColorSetAppearanceConfiguration]?
}

struct ColorSetAppearanceConfiguration: Encodable {
    let appearance: ColorSetAppearance
    let value: ColorSetAppearanceValue
}

enum ColorSetAppearance: String, Encodable {
    case luminosity
}

enum ColorSetAppearanceValue: String, Encodable {
    case dark
}

enum ColorSetIdiom: String, Encodable {
    case universal
}

struct ColorSetColor: Encodable {
    let colorSpace: ColorSetColorSpace
    let components: ColorSetColorComponents

    enum CodingKeys: String, CodingKey {
        case colorSpace = "color-space"
        case components
    }
}

enum ColorSetColorSpace: String, Encodable {
    case `default` = "extended-srgb"
}

struct ColorSetColorComponents: Encodable {
    let alpha: String
    let blue: String
    let green: String
    let red: String
}

extension ColorSetContents {
    init(variants: ColorAssetVariants) {
        self.init(colors: [
            ColorSetColorConfiguration(
                color: ColorSetColor(
                    colorSpace: .default,
                    components: ColorSetColorComponents(hex: variants.light)
                ),
                appearances: nil
            ),
            ColorSetColorConfiguration(
                color: ColorSetColor(
                    colorSpace: .default,
                    components: ColorSetColorComponents(hex: variants.dark)
                ),
                appearances: [
                    ColorSetAppearanceConfiguration(
                        appearance: .luminosity,
                        value: .dark
                    ),
                ]
            ),
        ])
    }
}

extension ColorSetColorComponents {
    private static let clear = ColorComponents(red: 0, green: 0, blue: 0, alpha: 0)

    init(hex: String) {
        let components = ColorComponents(hex: hex) ?? ColorSetColorComponents.clear

        self.init(
            alpha: String(format: "%.3f", components.alpha),
            blue: String(format: "0x%02lX", Int(components.blue * 255)),
            green: String(format: "0x%02lX", Int(components.green * 255)),
            red: String(format: "0x%02lX", Int(components.red * 255))
        )
    }
}

struct ColorComponents {
    let red, green, blue, alpha: CGFloat

    init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }

    init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xFF00_0000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00FF_0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000_FF00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x0000_00FF) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}

func saveAsColorSet(_ colorAssets: ColorAssets, xcassetsFolderURL: URL) {
    let fileManager = FileManager.default
    let encoder = JSONEncoder()
    encoder.outputFormatting = [.prettyPrinted, .sortedKeys]

    createFolderIfDoesNotExist(xcassetsFolderURL, fileManager: fileManager)

    let colorSetContentsURL = xcassetsFolderURL.appendingPathComponent("Contents.json", isDirectory: false)

    saveFile(ColorSetContentsInfo(), destinationURL: colorSetContentsURL, encoder: encoder, fileManager: fileManager)

    for (name, variants) in colorAssets {
        saveAsColorSet(xcassetsFolderURL: xcassetsFolderURL, colorName: name, variants: variants, encoder: encoder, fileManager: fileManager)
    }
}

func saveAsColorSet(xcassetsFolderURL: URL, colorName: String, variants: ColorAssetVariants, encoder: JSONEncoder, fileManager: FileManager) {
    let camelCasedColorName = colorName.camelCased
    let colorSetFolderURL = xcassetsFolderURL.appendingPathComponent("\(camelCasedColorName).colorset", isDirectory: true)
    let colorSetContentsURL = colorSetFolderURL.appendingPathComponent("Contents.json")

    createFolderIfDoesNotExist(colorSetFolderURL, fileManager: fileManager)
    saveFile(ColorSetContents(variants: variants), destinationURL: colorSetContentsURL, encoder: encoder, fileManager: fileManager)
}

func saveFile<T>(_ value: T, destinationURL: URL, encoder: JSONEncoder, fileManager _: FileManager) where T: Encodable {
    do {
        if let jsonString = try String(data: encoder.encode(value), encoding: .utf8) {
            try jsonString.write(to: destinationURL, atomically: true, encoding: .utf8)
        }
    } catch {
        print("Error encoding to file: \(error)")
    }
}

func createFolderIfDoesNotExist(_ folderURL: URL, fileManager: FileManager) {
    if !fileManager.fileExists(atPath: folderURL.path) {
        do {
            try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true)
        } catch {
            print("Failed to create directory at path \(folderURL.path): \(error)")
        }
    }
}

func parseSourceFile(url: URL) -> ColorAssets? {
    let decoder = JSONDecoder()
    do {
        return try decoder.decode(ColorAssets.self, from: Data(contentsOf: url))
    } catch {
        print("Error parsing source file: \(error)")
        return nil
    }
}

typealias ColorAssets = [String: ColorAssetVariants]

struct ColorAssetVariants: Decodable {
    let light: String
    let dark: String
}
