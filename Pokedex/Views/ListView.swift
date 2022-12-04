//
//  ContentView.swift
//  Pokedex
//
//  Created by Daniel Basaldua on 11/28/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var viewModel: PokedexViewModel
    @State private var searchText: String = ""
    
    var filteredPokemon: [Pokemon] {
        if searchText.isEmpty {
            return viewModel.pokemon
        } else {
            return viewModel.pokemon.filter {$0.name.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredPokemon, id: \.id) { pokemon in
                    NavigationLink(destination: DetailView(pokemon: pokemon).environmentObject(viewModel)) {
                        Text(pokemon.name)
                    }
                }
                .listRowBackground(APP_COLOR.ignoresSafeArea())
            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink {
//                        <#code#>
//                    } label: {
//                        <#code#>
//                    }
//
//                }
//            }
            .background(APP_COLOR.ignoresSafeArea())
            .listStyle(.plain)
            .navigationTitle("All Pokemon")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: "Search for a Pokemon")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = PokedexViewModel()
        let pk: [Pokemon] = [
            Pokemon(name: "Bulbasaur", type_one: "Grass", type_two: "Poison"),
            Pokemon(name: "Ivysaur", type_one: "Grass", type_two: "Poison"),
            Pokemon(name: "Venusaur", type_one: "Grass", type_two: "Poison"),
            Pokemon(name: "Charmander", type_one: "Fire", type_two: nil),
            Pokemon(name: "Charmeleon", type_one: "Fire", type_two: nil),
            Pokemon(name: "Charizard", type_one: "Fire", type_two: "Flying"),
            Pokemon(name: "Squirtle", type_one: "Water", type_two: nil),
            Pokemon(name: "Wartortle", type_one: "Water", type_two: nil),
            Pokemon(name: "Blastoise", type_one: "Water", type_two: nil),
            Pokemon(name: "Caterpie", type_one: "Bug", type_two: nil),
            Pokemon(name: "Metapod", type_one: "Bug", type_two: nil),
            Pokemon(name: "Butterfree", type_one: "Bug", type_two: "Flying"),
            Pokemon(name: "Weedle", type_one: "Bug", type_two: "Poison"),
            Pokemon(name: "Kakuna", type_one: "Bug", type_two: "Poison"),
            Pokemon(name: "Beedrill", type_one: "Bug", type_two: "Poison"),
            Pokemon(name: "Pidgey", type_one: "Normal", type_two: "Flying"),
            Pokemon(name: "Pidgeotto", type_one: "Normal", type_two: "Flying"),
            Pokemon(name: "Pidgeot", type_one: "Normal", type_two: "Flying"),
            Pokemon(name: "Rattata", type_one: "Normal", type_two: nil),
            Pokemon(name: "Raticate", type_one: "Normal", type_two: nil),
            Pokemon(name: "Spearow", type_one: "Normal", type_two: "Flying"),
            Pokemon(name: "Fearow", type_one: "Normal", type_two: "Flying"),
            Pokemon(name: "Ekans", type_one: "Poison", type_two: nil),
            Pokemon(name: "Arbok", type_one: "Poison", type_two: nil),
            Pokemon(name: "Pikachu", type_one: "Electric", type_two: nil),
            Pokemon(name: "Raichu", type_one: "Electric", type_two: nil),
            Pokemon(name: "Sandshrew", type_one: "Ground", type_two: nil),
            Pokemon(name: "Sandslash", type_one: "Ground", type_two: nil),
            Pokemon(name: "Nidoran", type_one: "Poison", type_two: nil),
            Pokemon(name: "Nidorina", type_one: "Poison", type_two: nil),
            Pokemon(name: "Nidoqueen", type_one: "Poison", type_two: "Ground"),
            Pokemon(name: "Nidorino", type_one: "Poison", type_two: nil),
            Pokemon(name: "Nidoking", type_one: "Poison", type_two: "Ground"),
            Pokemon(name: "Clefairy", type_one: "Normal", type_two: nil),
            Pokemon(name: "Clefable", type_one: "Normal", type_two: nil),
            Pokemon(name: "Vulpix", type_one: "Fire", type_two: nil),
            Pokemon(name: "Ninetales", type_one: "Fire", type_two: nil),
            Pokemon(name: "Jigglypuff", type_one: "Normal", type_two: nil),
            Pokemon(name: "Wigglytuff", type_one: "Normal", type_two: nil),
            Pokemon(name: "Zubat", type_one: "Poison", type_two: "Flying"),
            Pokemon(name: "Golbat", type_one: "Poison", type_two: "Flying"),
            Pokemon(name: "Oddish", type_one: "Grass", type_two: "Poison"),
            Pokemon(name: "Gloom", type_one: "Grass", type_two: "Poison"),
            Pokemon(name: "Vileplume", type_one: "Grass", type_two: "Poison"),
            Pokemon(name: "Paras", type_one: "Bug", type_two: "Grass"),
            Pokemon(name: "Parasect", type_one: "Bug", type_two: "Grass"),
            Pokemon(name: "Venonat", type_one: "Bug", type_two: "Poison"),
            Pokemon(name: "Venomoth", type_one: "Bug", type_two: "Poison"),
            Pokemon(name: "Diglett", type_one: "Ground", type_two: nil),
            Pokemon(name: "Dugtrio", type_one: "Ground", type_two: nil),
            Pokemon(name: "Meowth", type_one: "Normal", type_two: nil),
            Pokemon(name: "Persian", type_one: "Normal", type_two: nil),
            Pokemon(name: "Psyduck", type_one: "Water", type_two: nil),
            Pokemon(name: "Golduck", type_one: "Water", type_two: nil),
            Pokemon(name: "Mankey", type_one: "Fighting", type_two: nil),
            Pokemon(name: "Primeape", type_one: "Fighting", type_two: nil),
            Pokemon(name: "Growlithe", type_one: "Fire", type_two: nil),
            Pokemon(name: "Arcanine", type_one: "Fire", type_two: nil),
            Pokemon(name: "Poliwag", type_one: "Water", type_two: nil),
            Pokemon(name: "Poliwhirl", type_one: "Water", type_two: nil),
            Pokemon(name: "Poliwrath", type_one: "Water", type_two: "Fighting"),
            Pokemon(name: "Abra", type_one: "Psychic", type_two: nil),
            Pokemon(name: "Kadabra", type_one: "Psychic", type_two: nil),
            Pokemon(name: "Alakazam", type_one: "Psychic", type_two: nil),
            Pokemon(name: "Machop", type_one: "Fighting", type_two: nil),
            Pokemon(name: "Machoke", type_one: "Fighting", type_two: nil),
            Pokemon(name: "Machamp", type_one: "Fighting", type_two: nil),
            Pokemon(name: "Bellsprout", type_one: "Grass", type_two: "Poison"),
            Pokemon(name: "Weepinbell", type_one: "Grass", type_two: "Poison"),
            Pokemon(name: "Victreebel", type_one: "Grass", type_two: "Poison"),
            Pokemon(name: "Tentacool", type_one: "Water", type_two: "Poison"),
            Pokemon(name: "Tentacruel", type_one: "Water", type_two: "Poison"),
            Pokemon(name: "Geodude", type_one: "Rock", type_two: "Ground"),
            Pokemon(name: "Graveler", type_one: "Rock", type_two: "Ground"),
            Pokemon(name: "Golem", type_one: "Rock", type_two: "Ground"),
            Pokemon(name: "Ponyta", type_one: "Fire", type_two: nil),
            Pokemon(name: "Rapidash", type_one: "Fire", type_two: nil),
            Pokemon(name: "Slowpoke", type_one: "Water", type_two: "Psychic"),
            Pokemon(name: "Slowbro", type_one: "Water", type_two: "Psychic"),
            Pokemon(name: "Magnemite", type_one: "Electric", type_two: "Steel"),
            Pokemon(name: "Magneton", type_one: "Electric", type_two: "Steel"),
            Pokemon(name: "Farfetch'd", type_one: "Normal", type_two: "Flying"),
            Pokemon(name: "Doduo", type_one: "Normal", type_two: "Flying"),
            Pokemon(name: "Dodrio", type_one: "Normal", type_two: "Flying"),
            Pokemon(name: "Seel", type_one: "Water", type_two: nil),
            Pokemon(name: "Dewgong", type_one: "Water", type_two: "Ice"),
            Pokemon(name: "Grimer", type_one: "Poison", type_two: nil),
            Pokemon(name: "Muk", type_one: "Poison", type_two: nil),
            Pokemon(name: "Shellder", type_one: "Water", type_two: nil),
            Pokemon(name: "Cloyster", type_one: "Water", type_two: "Ice"),
            Pokemon(name: "Gastly", type_one: "Ghost", type_two: "Poison"),
            Pokemon(name: "Haunter", type_one: "Ghost", type_two: "Poison"),
            Pokemon(name: "Gengar", type_one: "Ghost", type_two: "Poison"),
            Pokemon(name: "Onix", type_one: "Rock", type_two: "Ground"),
            Pokemon(name: "Drowzee", type_one: "Psychic", type_two: nil),
            Pokemon(name: "Hypno", type_one: "Psychic", type_two: nil),
            Pokemon(name: "Krabby", type_one: "Water", type_two: nil),
            Pokemon(name: "Kingler", type_one: "Water", type_two: nil),
            Pokemon(name: "Voltorb", type_one: "Electric", type_two: nil),
            Pokemon(name: "Electrode", type_one: "Electric", type_two: nil),
            Pokemon(name: "Exeggcute", type_one: "Grass", type_two: "Psychic"),
            Pokemon(name: "Exeggutor", type_one: "Grass", type_two: "Psychic"),
            Pokemon(name: "Cubone", type_one: "Ground", type_two: nil),
            Pokemon(name: "Marowak", type_one: "Ground", type_two: nil),
            Pokemon(name: "Hitmonlee", type_one: "Fighting", type_two: nil),
            Pokemon(name: "Hitmonchan", type_one: "Fighting", type_two: nil),
            Pokemon(name: "Lickitung", type_one: "Normal", type_two: nil),
            Pokemon(name: "Koffing", type_one: "Poison", type_two: nil),
            Pokemon(name: "Weezing", type_one: "Poison", type_two: nil),
            Pokemon(name: "Rhyhorn", type_one: "Ground", type_two: "Rock"),
            Pokemon(name: "Rhydon", type_one: "Ground", type_two: "Rock"),
            Pokemon(name: "Chansey", type_one: "Normal", type_two: nil),
            Pokemon(name: "Tangela", type_one: "Grass", type_two: nil),
            Pokemon(name: "Kangaskhan", type_one: "Normal", type_two: nil),
            Pokemon(name: "Horsea", type_one: "Water", type_two: nil),
            Pokemon(name: "Seadra", type_one: "Water", type_two: nil),
            Pokemon(name: "Goldeen", type_one: "Water", type_two: nil),
            Pokemon(name: "Seaking", type_one: "Water", type_two: nil),
            Pokemon(name: "Staryu", type_one: "Water", type_two: nil),
            Pokemon(name: "Starmie", type_one: "Water", type_two: "Psychic"),
            Pokemon(name: "Mr. Mime", type_one: "Psychic", type_two: nil),
            Pokemon(name: "Scyther", type_one: "Bug", type_two: "Flying"),
            Pokemon(name: "Jynx", type_one: "Ice", type_two: "Psychic"),
            Pokemon(name: "Electabuzz", type_one: "Electric", type_two: nil),
            Pokemon(name: "Magmar", type_one: "Fire", type_two: nil),
            Pokemon(name: "Pinsir", type_one: "Bug", type_two: nil),
            Pokemon(name: "Tauros", type_one: "Normal", type_two: nil),
            Pokemon(name: "Magikarp", type_one: "Water", type_two: nil),
            Pokemon(name: "Gyarados", type_one: "Water", type_two: "Flying"),
            Pokemon(name: "Lapras", type_one: "Water", type_two: "Ice"),
            Pokemon(name: "Ditto", type_one: "Normal", type_two: nil),
            Pokemon(name: "Eevee", type_one: "Normal", type_two: nil),
            Pokemon(name: "Vaporeon", type_one: "Water", type_two: nil),
            Pokemon(name: "Jolteon", type_one: "Electric", type_two: nil),
            Pokemon(name: "Flareon", type_one: "Fire", type_two: nil),
            Pokemon(name: "Porygon", type_one: "Normal", type_two: nil),
            Pokemon(name: "Omanyte", type_one: "Rock", type_two: "Water"),
            Pokemon(name: "Omastar", type_one: "Rock", type_two: "Water"),
            Pokemon(name: "Kabuto", type_one: "Rock", type_two: "Water"),
            Pokemon(name: "Kabutops", type_one: "Rock", type_two: "Water"),
            Pokemon(name: "Aerodactyl", type_one: "Rock", type_two: "Flying"),
            Pokemon(name: "Snorlax", type_one: "Normal", type_two: nil),
            Pokemon(name: "Articuno", type_one: "Ice", type_two: "Flying"),
            Pokemon(name: "Zapdos", type_one: "Electric", type_two: "Flying"),
            Pokemon(name: "Moltres", type_one: "Fire", type_two: "Flying"),
            Pokemon(name: "Dratini", type_one: "Dragon", type_two: nil),
            Pokemon(name: "Dragonair", type_one: "Dragon", type_two: nil),
            Pokemon(name: "Dragonite", type_one: "Dragon", type_two: "Flying"),
            Pokemon(name: "Mewtwo", type_one: "Psychic", type_two: nil),
            Pokemon(name: "Mew", type_one: "Psychic", type_two: nil),
        ]
        ListView().environmentObject(vm)
            .task {
                vm.pokemon = pk
            }
    }
}
