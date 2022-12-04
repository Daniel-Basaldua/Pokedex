//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Daniel Basaldua on 11/28/22.
//

import SwiftUI

let APP_COLOR = Color.init(red: 0.9, green: 0.9, blue: 0.9)

@main
struct PokedexApp: App {
    @StateObject var viewModel = PokedexViewModel()
    
    @State var databaseIsLoaded: Bool = false
    @State var allPokemonDidLoad: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if databaseIsLoaded == false || allPokemonDidLoad == false {
                LoadingView()
                    .task {
                        while (databaseIsLoaded == false || allPokemonDidLoad == false) {
                            databaseIsLoaded = await viewModel.establishConnection()
                            allPokemonDidLoad = await viewModel.loadPokemonFromDB()
                        }
                    }
            } else {
                ListView().environmentObject(viewModel)
            }
        }
    }
}
