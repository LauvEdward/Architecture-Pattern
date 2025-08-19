//
//  ImageUnsplashPresenter.swift
//  ArchitecturePatternSwift
//
//  Created by Lê Đình Phục on 19/8/25.
//

import Foundation
protocol LoadImageUnsplashPresentationLogic {
    func presentImage(response: LoadImageUnsplash.Response)
}
class LoadImageUnsplashPresenter {
    var view: LoadImageUnsplashDisplayLogic?
}

extension LoadImageUnsplashPresenter: LoadImageUnsplashPresentationLogic {
    func presentImage(response: LoadImageUnsplash.Response) {
        let viewModel = LoadImageUnsplash.ViewModel()
        viewModel.listImage = response.image
        view?.displayImage(viewModel: viewModel)
    }
}
