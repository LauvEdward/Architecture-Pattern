//
//  IceCreamDataStore.swift
//  ArchitecturePatternSwift
//
//  Created by Lê Đình Phục on 19/8/25.
//

import Foundation
class IceCreamDataStore: ObservableObject {
    @Published var displayedCones: [String] = []
    @Published var displayedToppings: [String] = []
    @Published var displayedFlavors: [String] = []
}
