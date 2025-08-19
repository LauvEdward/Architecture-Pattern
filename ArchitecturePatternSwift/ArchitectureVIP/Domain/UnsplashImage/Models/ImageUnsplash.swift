//
//  ImageUnsplash.swift
//  ArchitecturePatternSwift
//
//  Created by Lê Đình Phục on 19/8/25.
//

import Foundation
struct ImageUnsplash: Codable, Hashable {
    var width: Int?
    var height: Int?
    var urls: Urls
}

struct Urls: Codable, Hashable {
    var small: String
    var thumb: String
}
