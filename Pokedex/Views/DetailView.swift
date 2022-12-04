//
//  DetailView.swift
//  Pokedex
//
//  Created by Daniel Basaldua on 11/30/22.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var viewModel: PokedexViewModel
    
    @State private var hp: String = "-1"
    @State private var atk: String = "-1"
    @State private var def: String = "-1"
    @State private var spAtk: String = "-1"
    @State private var spDef: String = "-1"
    @State private var special: String = "-1"
    @State private var total: String = "-1"
    
    @State private var moves: [PokeMove] = []
    
    var pokemon: Pokemon
    
    var body: some View {
            VStack {
                Text(pokemon.name).font(.largeTitle)
                
                HStack {
                    Text("Type One:").font(.title2)
                    Text(pokemon.type_one).font(.title2)
                    Text("|").font(.title2)
                    Text("Type Two:").font(.title2)
                    Text(pokemon.type_two ?? "None").font(.title2)
                }.padding(.top)
                
                HStack {
                    Text("Hp=\(hp)").font(.title3).frame(width: 120)
                    Text("Atk=\(atk)").font(.title3).frame(width: 120)
                    Text("Def=\(def)").font(.title3).frame(width: 120)
                }.padding(.top)
                
                HStack {
                    Text("Special=\(special)").font(.title3).frame(width: 120)
                    Text("SpAtk=\(spAtk)").font(.title3).frame(width: 120)
                    Text("SpDef=\(spDef)").font(.title3).frame(width: 120)
                }.padding(.top)
                
                Text("Total=\(total)").font(.title3).padding(.top).frame(width: 120)
                
                HStack {
                    Spacer()
                    Text("Lvl").underline().frame(width: 30)
                    Text("Name").underline().frame(width: 140)
                    Text("Type").underline().frame(width: 100)
                    Text("Power").underline().frame(width: 50)
                    Text("PP").underline().frame(width: 30)
                    Spacer()
                }
                .padding(.top)
                
                ScrollView(.vertical, showsIndicators: true) {
                    ForEach(moves, id: \.id) { move in
                        HStack {
                            Spacer()
                            Text("\(move.lvl)").frame(width: 30)
                            Text(move.name).font(.body).frame(width: 140)
                            Text(move.type).frame(width: 100)
                            Text("\(move.power)").frame(width: 50)
                            Text("\(move.pp)").frame(width: 30)
                            Spacer()
                        }
                        .padding(.bottom)
                    }
                }
                Spacer()
            }
            .background(APP_COLOR.ignoresSafeArea())
            .task {
                let stats = await viewModel.getStats(name: pokemon.name)
                hp = String(stats[0])
                atk = String(stats[1])
                def = String(stats[2])
                spAtk = String(stats[3])
                spDef = String(stats[4])
                special = String(stats[5])
                total = String(stats[6])
                moves = await viewModel.getMoves(name: pokemon.name)
            }
    }
}



//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let temp = Pokemon(name: "Mew", type_one: "Psychic", type_two: nil)
//        let vm = PokedexViewModel()
//        DetailView(pokemon: temp)
//            .environmentObject(vm)
//    }
//}
