// swift-tools-version:5.0

// Package.swift
//
// Copyright (c) 2015–present MLSDev (http://mlsdev.org/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import PackageDescription

let package = Package(
    name: "TRON",
    platforms: [
        .iOS(.v10),
        .tvOS(.v10),
        .macOS(.v10_12),
        .watchOS(.v3)
    ],
    products: [
        .library(name: "TRON", targets: ["TRON"]),
        .library(name: "TRONSwiftyJSON", targets: ["TRONSwiftyJSON"]),
        .library(name: "RxTRON", targets: ["RxTRON"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.0.0-beta.6")),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", .upToNextMajor(from: ("5.0.0"))),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "5.0.0"))
    ],
    targets: [
         .target(
            name: "TRON",
            dependencies: [ "Alamofire" ]),
        .target(
            name: "RxTRON",
            dependencies: [
                "TRON",
                "RxSwift"
            ]),
        .target(
            name: "TRONSwiftyJSON",
            dependencies: [
                "TRON",
                "SwiftyJSON"]),
//        .testTarget(name: "Tests", dependencies: ["TRON", "TRONSwiftyJSON", "RxTRON"])
    ]
)
