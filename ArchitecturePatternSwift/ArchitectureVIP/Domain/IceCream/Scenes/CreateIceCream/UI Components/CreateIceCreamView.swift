//
//  CreateIceCreamView.swift
//  ArchitecturePatternSwift
//
//  Created by Lauv Edward on 8/18/25.
//

import SwiftUI

struct CreateIceCreamView: View {
    // Todo: add interactor
    var interactor: CreateIceCreamBusinessLogic?
    var body: some View {
        VStack {
            
        }.onAppear {
            fetchIceCream()
        }
    }
    
    func fetchIceCream() {
        let request = CreateIceCream.LoadIceCream.Request()
        
    }
}

#Preview {
    CreateIceCreamView()
}
