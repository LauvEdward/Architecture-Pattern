//
//  CreateIceCreamView.swift
//  ArchitecturePatternSwift
//
//  Created by Lauv Edward on 8/18/25.
//

import SwiftUI

protocol CreateIceCreamDisplayLogic {
    func displayIceCream(viewModel: CreateIceCream.LoadIceCream.ViewModel)
}

struct CreateIceCreamView: View {
    @ObservedObject var iceCream = IceCreamDataStore()
    @State var selectedCone: String = ""
    @State var selectedFlavor: String = ""
    @State var selectedTopping: String = ""
    @State var showDoneAlert = false
    var interactor: CreateIceCreamBusinessLogic?
    var body: some View {
        NavigationView {
            Form {
                Section("LET'S MAKE AN ICE CREAM") {
                    Picker("Select a cone or cup", selection: $selectedCone) {
                        ForEach(iceCream.displayedCones, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Choose your flavor", selection: $selectedFlavor) {
                        ForEach(iceCream.displayedFlavors, id: \.self) {
                            Text($0)
                        }
                    }.disabled(selectedCone.isEmpty)
                    Picker("Choose a topping", selection: $selectedTopping) {
                        ForEach(iceCream.displayedToppings, id: \.self) {
                            Text($0)
                        }
                    }.disabled(selectedCone.isEmpty || selectedFlavor.isEmpty)
                }
                Section {
                    Button {
                        showDoneAlert = true
                    } label: {
                        Text("DONE")
                            .font(.title3)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .alert(isPresented: $showDoneAlert) {
                        Alert(
                            title: Text("Your ice cream is ready!"),
                            message: Text("Let's make a new one. You can never have too much ice creeam..."),
                            dismissButton: .default(Text("OK")) {
                                selectedCone = ""
                                selectedFlavor = ""
                                selectedTopping = ""
                            }
                        )
                    }
                }
                .disabled(selectedCone.isEmpty || selectedFlavor.isEmpty || selectedTopping.isEmpty)
                Section {
                    IceCreamImageView(selectedCone: $selectedCone, selectedTopping: $selectedTopping, selectedFlavor: $selectedFlavor)
                }
            }.onAppear {
                fetchIceCream()
            }.navigationViewStyle(.stack)
        }
    }
    
    func fetchIceCream() {
        let request = CreateIceCream.LoadIceCream.Request()
        interactor?.loadIceCream(request: request)
    }
}

extension CreateIceCreamView: CreateIceCreamDisplayLogic {
    func displayIceCream(viewModel: CreateIceCream.LoadIceCream.ViewModel) {
        iceCream.displayedCones = viewModel.cones
        iceCream.displayedToppings = viewModel.toppings
        iceCream.displayedFlavors = viewModel.flavors
    }
}

#Preview {
    CreateIceCreamView()
}
