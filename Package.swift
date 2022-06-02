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
        .systemLibrary(name: "CiOSNDI"),
        .target(
            name: "swift-ndi",
            dependencies: ["CiOSNDI"],
            linkerSettings: [
                .linkedFramework("Accelerate"),
                .linkedFramework("VideoToolbox"),
                .linkedLibrary("c++")
            ]
        ),
//        .testTarget(
//            name: "swift-ndiTests",
//            dependencies: ["swift-ndi"]),
    ]
    
)
