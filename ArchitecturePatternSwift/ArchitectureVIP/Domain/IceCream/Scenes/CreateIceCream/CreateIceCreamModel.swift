//
//  CreateIceCreamModel.swift
//  ArchitecturePatternSwift
//
//  Created by Lauv Edward on 8/18/25.
//

import Foundation
enum CreateIceCream {
    enum LoadIceCream {
        struct Request {}
        struct Response {
            var iceCreamData: IceCream
        }
        struct ViewModel {
            var cones: [String]
            var flavors: [String]
            var toppings: [String]
        }
    }
}
