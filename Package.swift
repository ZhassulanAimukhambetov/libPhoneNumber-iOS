// swift-tools-version:4.1
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "libPhoneNumber",
    products: [
        .library(
            name: "libPhoneNumber",
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
            ]
        ),
        .testTarget(
            name: "libPhoneNumberTests",
            dependencies: ["libPhoneNumber"],
            path: "libPhoneNumberTests",
            sources: [
                "NBAsYouTypeFormatterTest.m",
                "NBPhoneNumberParsingPerfTest.m",
                "NBPhoneNumberUtilTest.m",
            ]
        )
    ]
)
