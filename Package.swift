// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-ndi",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "swift-ndi",
            targets: ["swift-ndi"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "swift-ndi", dependencies: ["NDI_iOS"]),
        .testTarget(
            name: "swift-ndiTests",
            dependencies: ["swift-ndi"]),
        .binaryTarget(name: "NDI_iOS", path: "Libraries/ndi_artifacts/5.0.8/NDI_iOS.xcframework")
//        .binaryTarget(name: "NDI_iOS", url: "https://192.168.170.117/static/ndi_5.0.8/NDI_iOS.xcframework.zip", checksum: "564ab41ffe8f59acd2a971f5a720294f4dff6e55205c101ce480cb6cbd2a7d1c"),
    ]
    
)
