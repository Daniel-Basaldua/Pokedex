//
//  DetailView.swift
//  Pokedex
//
//  Created by Daniel Basaldua on 11/30/22.
//

import SwiftUI

struct DetailView: View {
    var pokemon: Pokemon
    var body: some View {
        ScrollView {
            Text(pokemon.name)
                .font(.largeTitle)
            Spacer()
        }
    }
}


let temp = Pokemon(name: "Mew")
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pokemon: temp)
    }
}
