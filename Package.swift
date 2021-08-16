// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GLTFSceneKit",
    platforms: [
        .iOS(.v12),
        .macOS(.v11)
    ],
    products: [
        .library(name: "GLTFSceneKit", targets: ["GLTFSceneKit"]),
    ],
    targets: [
        .target(
            name: "GLTFSceneKit",
            resources: [
                .copy("Resources/GLTFShaderModifierFragment_alphaCutoff.shader"),
                .copy("Resources/GLTFShaderModifierSurface_alphaModeBlend.shader"),
                .copy("Resources/GLTFShaderModifierSurface_doubleSidedWorkaround.shader"),
                .copy("Resources/GLTFShaderModifierSurface_pbrSpecularGlossiness_doubleSidedWorkaround.shader"),
                .copy("Resources/GLTFShaderModifierSurface_pbrSpecularGlossiness_texture_doubleSidedWorkaround.shader"),
                .copy("Resources/GLTFShaderModifierSurface_pbrSpecularGlossiness.shader"),
                .copy("Resources/GLTFShaderModifierSurface.shader"),
            ])
    ]
)
