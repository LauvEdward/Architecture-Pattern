//
//  LoadImageUnsplashNetworkingWorker.swift
//  ArchitecturePatternSwift
//
//  Created by Lê Đình Phục on 19/8/25.
//
// access key ydaAxSMzT0WqhEg8EsoNckuvyg2LglIhFHrpk27aNec
// secret key LOmZuneXqYZLHO4pSj1pDhADw5cSRRJlHGG8HDc_mIM
import Foundation
protocol LoadImageUnsplashNetworking {
    func loadImage(urlString: String, completion: @escaping (Result<Data, Error>) -> Void)
}
class LoadImageUnsplashNetworkingWorker: LoadImageUnsplashNetworking {
    func loadImage(urlString: String, completion: @escaping (Result<Data, any Error>) -> Void) {
        guard let url = URL(string: "\(urlString)?client_id=ydaAxSMzT0WqhEg8EsoNckuvyg2LglIhFHrpk27aNec") else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
    }
}
