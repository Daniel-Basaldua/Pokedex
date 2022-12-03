//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Daniel Basaldua on 11/28/22.
//

import SwiftUI

@main
struct PokedexApp: App {
    @StateObject var viewModel = PokedexViewModel()
    @State var loaded: Bool = false
    var body: some Scene {
        WindowGroup {
            if loaded == false {
                LoadingView()
                    .task {
                        loaded = await viewModel.establishConnection()
                    }
            } else {
                ListView()
            }
        }
    }
}
