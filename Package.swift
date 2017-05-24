// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "Models",
    dependencies: [
        .Package(url: "https://github.com/vapor/json.git", majorVersion: 2),
    ]
)
