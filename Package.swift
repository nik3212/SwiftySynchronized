import PackageDescription

let package = Package(name: "SwiftySynchronized",
                      platforms: [.macOS(.v10_10),
                                  .iOS(.v9),
                                  .tvOS(.v9),
                                  .watchOS(.v2)],
                      products: [.library(name: "SwiftySynchronized",
                                          targets: ["SwiftySynchronized"])],
                      targets: [.target(name: "SwiftySynchronized",
                                        path: "Sources"),
                                .testTarget(name: "SwiftySynchronizedTests",
                                            dependencies: ["SwiftySynchronized"],
                                            path: "Tests")],
                      swiftLanguageVersions: [.v5])
