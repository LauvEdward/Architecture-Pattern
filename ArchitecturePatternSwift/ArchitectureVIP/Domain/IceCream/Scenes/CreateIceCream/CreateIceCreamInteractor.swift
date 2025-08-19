//
//  CreateIceCreamInteractor.swift
//  ArchitecturePatternSwift
//
//  Created by Lauv Edward on 8/18/25.
//

import Foundation
protocol CreateIceCreamBusinessLogic {
    func loadIceCream(request: CreateIceCream.LoadIceCream.Request)
}
class CreateIceCreamInteractor {
    var presenter: CreateIceCreamPresentationLogic?
}
extension CreateIceCreamInteractor: CreateIceCreamBusinessLogic {
    func loadIceCream(request: CreateIceCream.LoadIceCream.Request) {
        guard let fileURL = Bundle.main.url(forResource: "icecream", withExtension: "json") else {
            fatalError("Couldn't find icecream.json in project")
        }
        guard let data = try? Data(contentsOf: fileURL) else {
            fatalError("Couldn't load icecream.json")
        }
        let iceCream = try? JSONDecoder().decode(IceCream.self, from: data)
        guard let iceCream = iceCream else {
            fatalError("Couldn't decode model IceCream")
        }
        print("CreateIceCreamInteractor loadIceCream \(iceCream)")
        let response = CreateIceCream.LoadIceCream.Response(iceCreamData: iceCream)
        presenter?.presentIceCream(response: response)
    }
}
