//
//  IceCreamImageView.swift
//  ArchitecturePatternSwift
//
//  Created by Lê Đình Phục on 19/8/25.
//

import SwiftUI

struct IceCreamImageView: View {
    @Binding var selectedCone: String
    @Binding var selectedTopping: String
    @Binding var selectedFlavor: String
    var body: some View {
        HStack {
            Spacer()
            ZStack {
                if selectedCone.isEmpty && selectedFlavor.isEmpty && selectedTopping.isEmpty {
                    Text("Prepraring your ice cream...")
                    
                }
                if !selectedCone.isEmpty {
                    Image(selectedCone)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 220)
                        .offset(y: 40)
                }
                if !selectedFlavor.isEmpty {
                    Image(selectedFlavor)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                        .offset(y: -63)
                }
                if !selectedTopping.isEmpty {
                    Image(selectedTopping)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                        .offset(y: -63)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    IceCreamImageView(selectedCone: .constant("Sugar Cone"), selectedTopping: .constant("Chocolate"), selectedFlavor: .constant("Sprinkles"))
}
