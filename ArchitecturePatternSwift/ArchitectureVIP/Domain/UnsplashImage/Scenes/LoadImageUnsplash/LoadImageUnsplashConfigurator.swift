//
//  LoadImageUnsplashConfigurator.swift
//  ArchitecturePatternSwift
//
//  Created by Lê Đình Phục on 19/8/25.
//

import SwiftUI
extension ImageUnsplashView {
    func configureView() -> some View {
        var view = self
        let interactor = LoadImageUnsplashInteractor()
        let presenter = LoadImageUnsplashPresenter()
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        return view
    }
}
