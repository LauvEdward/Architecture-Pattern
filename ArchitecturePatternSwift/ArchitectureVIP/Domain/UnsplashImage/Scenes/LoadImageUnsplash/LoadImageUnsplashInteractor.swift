//
//  ImageUnsplashInteractor.swift
//  ArchitecturePatternSwift
//
//  Created by Lê Đình Phục on 19/8/25.
//

import Foundation

protocol LoadImageUnsplashBussinessLogic {
    func loadImage(request: LoadImageUnsplash.Request)
}

class LoadImageUnsplashInteractor {
    var presenter: LoadImageUnsplashPresentationLogic?
}

extension LoadImageUnsplashInteractor: LoadImageUnsplashBussinessLogic {
    func loadImage(request: LoadImageUnsplash.Request) {
        let networkService = LoadImageUnsplashNetworkingWorker()
        networkService.loadImage(urlString: "https://api.unsplash.com/photos/") { results in
            switch results {
            case .success(let success):
                let listImage = self.parseJSON(success)
                self.presenter?.presentImage(response: LoadImageUnsplash.Response(image: listImage))
            case .failure(let failure):
                fatalError("network load image error: \(failure)")
            }
        }
    }
    
    func parseJSON(_ data: Data) -> [ImageUnsplash] {
        do {
            let json = try JSONDecoder().decode([ImageUnsplash].self, from: data)
            return json
        } catch {
            fatalError("parse json error: \(error)")
        }
    }
}
