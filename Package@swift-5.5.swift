// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "libPhoneNumber_iOS",
    platforms: [
        .macOS(.v10_10),
        .macCatalyst(.v13),
        .iOS(.v11),
        .tvOS(.v11),
        .watchOS(.v4)
    ],
    products: [
        .library(
            name: "libPhoneNumber_iOS",
            targets: ["libPhoneNumber_iOS"]
        )
    ],
    targets: [
        .target(
            name: "libPhoneNumber_iOS",
            path: "libPhoneNumber",
            exclude: ["GeneratePhoneNumberHeader.sh", "Info.plist"],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("Internal")
            ],
            linkerSettings: [
                .linkedFramework("Contacts", .when(platforms: [.iOS, .macOS, .macCatalyst, .watchOS])),
            ]
        ),
        .testTarget(
            name: "libPhoneNumberTests",
            dependencies: ["libPhoneNumber_iOS"],
            path: "libPhoneNumberTests",
            sources: [
                "NBAsYouTypeFormatterTest.m",
                "NBPhoneNumberParsingPerfTest.m",
                "NBPhoneNumberUtilTest.m",
            ]
        )
    ]
)
