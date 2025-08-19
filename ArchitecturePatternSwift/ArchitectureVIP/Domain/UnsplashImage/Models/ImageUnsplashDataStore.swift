//
//  ImageUnsplashDataStore.swift
//  ArchitecturePatternSwift
//
//  Created by Lê Đình Phục on 19/8/25.
//

import Foundation

class ImageUnsplashDataStore: ObservableObject {
    @Published var images: [ImageUnsplash] = []
}
