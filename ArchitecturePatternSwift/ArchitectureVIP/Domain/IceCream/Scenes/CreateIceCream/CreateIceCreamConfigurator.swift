//
//  CreateIceCreamConfigurator.swift
//  ArchitecturePatternSwift
//
//  Created by Lê Đình Phục on 19/8/25.
//

import SwiftUI
extension CreateIceCreamView {
    func configureView() -> some View {
        var view = self
        let interactor = CreateIceCreamInteractor()
        let presenter = CreateIceCreamPresenter()
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        return view
    }
}
