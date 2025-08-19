//
//  ImageUnsplashModel.swift
//  ArchitecturePatternSwift
//
//  Created by Lê Đình Phục on 19/8/25.
//

import Foundation
enum LoadImageUnsplash {
    struct Request {}
    struct Response {
        var image: [ImageUnsplash]
    }
    class ViewModel {
        var listImage: [ImageUnsplash] = []
    }
}
