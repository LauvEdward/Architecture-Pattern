//
//  ImageUnsplashView.swift
//  ArchitecturePatternSwift
//
//  Created by Lê Đình Phục on 19/8/25.
//

import SwiftUI

protocol LoadImageUnsplashDisplayLogic {
    func displayImage(viewModel: LoadImageUnsplash.ViewModel)
}

struct ImageUnsplashView: View {
    var interactor: LoadImageUnsplashInteractor?
    @ObservedObject var listImage = ImageUnsplashDataStore()
    var body: some View {
        NavigationView {
            Form {
                ForEach(listImage.images, id: \.self) { img in
                    AsyncImage(url: URL(string: img.urls.thumb)) { results in
                        switch results {
                        case .failure(_):
                            Image(systemName: "photo")
                        case .success(let image):
                            image
                                .resizable()
                        default:
                            ProgressView()
                        }
                    }
                }
            }
        }
        .onAppear {
            loadListImage()
        }
    }
    
    func loadListImage() {
        let request = LoadImageUnsplash.Request()
        interactor?.loadImage(request: request)
    }
}

extension ImageUnsplashView: LoadImageUnsplashDisplayLogic {
    func displayImage(viewModel: LoadImageUnsplash.ViewModel) {
        DispatchQueue.main.async {
            print(viewModel.listImage)
            self.listImage.images = viewModel.listImage
        }
    }
}
