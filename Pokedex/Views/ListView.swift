//
//  ContentView.swift
//  Pokedex
//
//  Created by Daniel Basaldua on 11/28/22.
//

import SwiftUI


/*
let pokemon: [String] = [
    "Bulbasaur","Ivysaur","Venusaur","Charmander","Charmeleon",
    "Charizard","Squirtle","Wartortle","Blastoise","Caterpie",
    "Metapod","Butterfree","Weedle","Kakuna","Beedrill",
    "Pidgey","Pidgeotto","Pidgeot","Rattata","Raticate",
    "Spearow","Fearow","Ekans","Arbok","Pikachu",
    "Raichu","Sandshrew","Sandslash","NidoranF","Nidorina",
    "Nidoqueen","NidoranM","Nidorino","Nidoking","Clefairy",
    "Clefable","Vulpix","Ninetales","Jigglypuff","Wigglytuff",
    "Zubat","Golbat","Oddish","Gloom","Vileplume",
    "Paras","Parasect","Venonat","Venomoth","Diglett",
    "Dugtrio","Meowth","Persian","Psyduck","Golduck",
    "Mankey","Primeape","Growlithe","Arcanine","Poliwag",
    "Poliwhirl","Poliwrath","Abra","Kadabra","Alakazam",
    "Machop","Machoke","Machamp","Bellsprout","Weepinbell",
    "Victreebel","Tentacool","Tentacruel","Geodude","Graveler",
    "Golem","Ponyta","Rapidash","Slowpoke","Slowbro",
    "Magnemite","Magneton","Farfetch'd","Doduo","Dodrio",
    "Seel","Dewgong","Grimer","Muk","Shellder",
    "Cloyster","Gastly","Haunter","Gengar","Onix",
    "Drowzee","Hypno","Krabby","Kingler","Voltorb",
    "Electrode","Exeggcute","Exeggutor","Cubone","Marowak",
    "Hitmonlee","Hitmonchan","Lickitung","Koffing","Weezing",
    "Rhyhorn","Rhydon","Chansey","Tangela","Kangaskhan",
    "Horsea","Seadra","Goldeen","Seaking","Staryu",
    "Starmie","Mr. Mime","Scyther","Jynx","Electabuzz",
    "Magmar","Pinsir","Tauros","Magikarp","Gyarados",
    "Lapras","Ditto","Eevee","Vaporeon","Jolteon",
    "Flareon","Porygon","Omanyte","Omastar","Kabuto",
    "Kabutops","Aerodactyl","Snorlax","Articuno","Zapdos",
    "Moltres","Dratini","Dragonair","Dragonite","Mewtwo","Mew"
]
*/
//This array should be imported from postgress
let pokemon: [Pokemon] = [
    Pokemon(name: "Bulbasaur"),
    Pokemon(name: "Ivysaur"),
    Pokemon(name: "Venusaur"),
    Pokemon(name: "Charmander"),
    Pokemon(name: "Charmeleon"),
    Pokemon(name: "Charizard"),
    Pokemon(name: "Squirtle"),
    Pokemon(name: "Wartortle"),
    Pokemon(name: "Blastoise"),
    Pokemon(name: "Caterpie"),
    Pokemon(name: "Metapod"),
    Pokemon(name: "Butterfree"),
    Pokemon(name: "Weedle"),
    Pokemon(name: "Kakuna"),
    Pokemon(name: "Beedrill"),
    Pokemon(name: "Pidgey"),
    Pokemon(name: "Pidgeotto"),
    Pokemon(name: "Pidgeot"),
    Pokemon(name: "Rattata"),
    Pokemon(name: "Raticate"),
    Pokemon(name: "Spearow"),
    Pokemon(name: "Fearow"),
    Pokemon(name: "Ekans"),
    Pokemon(name: "Arbok"),
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Raichu"),
    Pokemon(name: "Sandshrew"),
    Pokemon(name: "Sandslash"),
    Pokemon(name: "NidoranF"),
    Pokemon(name: "Nidorina"),
    Pokemon(name: "Nidoqueen"),
    Pokemon(name: "NidoranM"),
    Pokemon(name: "Nidorino"),
    Pokemon(name: "Nidoking"),
    Pokemon(name: "Clefairy"),
    Pokemon(name: "Clefable"),
    Pokemon(name: "Vulpix"),
    Pokemon(name: "Ninetales"),
    Pokemon(name: "Jigglypuff"),
    Pokemon(name: "Wigglytuff"),
    Pokemon(name: "Zubat"),
    Pokemon(name: "Golbat"),
    Pokemon(name: "Oddish"),
    Pokemon(name: "Gloom"),
    Pokemon(name: "Vileplume"),
    Pokemon(name: "Paras"),
    Pokemon(name: "Parasect"),
    Pokemon(name: "Venonat"),
    Pokemon(name: "Venomoth"),
    Pokemon(name: "Diglett"),
    Pokemon(name: "Dugtrio"),
    Pokemon(name: "Meowth"),
    Pokemon(name: "Persian"),
    Pokemon(name: "Psyduck"),
    Pokemon(name: "Golduck"),
    Pokemon(name: "Mankey"),
    Pokemon(name: "Primeape"),
    Pokemon(name: "Growlithe"),
    Pokemon(name: "Arcanine"),
    Pokemon(name: "Poliwag"),
    Pokemon(name: "Poliwhirl"),
    Pokemon(name: "Poliwrath"),
    Pokemon(name: "Abra"),
    Pokemon(name: "Kadabra"),
    Pokemon(name: "Alakazam"),
    Pokemon(name: "Machop"),
    Pokemon(name: "Machoke"),
    Pokemon(name: "Machamp"),
    Pokemon(name: "Bellsprout"),
    Pokemon(name: "Weepinbell"),
    Pokemon(name: "Victreebel"),
    Pokemon(name: "Tentacool"),
    Pokemon(name: "Tentacruel"),
    Pokemon(name: "Geodude"),
    Pokemon(name: "Graveler"),
    Pokemon(name: "Golem"),
    Pokemon(name: "Ponyta"),
    Pokemon(name: "Rapidash"),
    Pokemon(name: "Slowpoke"),
    Pokemon(name: "Slowbro"),
    Pokemon(name: "Magnemite"),
    Pokemon(name: "Magneton"),
    Pokemon(name: "Farfetch'd"),
    Pokemon(name: "Doduo"),
    Pokemon(name: "Dodrio"),
    Pokemon(name: "Seel"),
    Pokemon(name: "Dewgong"),
    Pokemon(name: "Grimer"),
    Pokemon(name: "Muk"),
    Pokemon(name: "Shellder"),
    Pokemon(name: "Cloyster"),
    Pokemon(name: "Gastly"),
    Pokemon(name: "Haunter"),
    Pokemon(name: "Gengar"),
    Pokemon(name: "Onix"),
    Pokemon(name: "Drowzee"),
    Pokemon(name: "Hypno"),
    Pokemon(name: "Krabby"),
    Pokemon(name: "Kingler"),
    Pokemon(name: "Voltorb"),
    Pokemon(name: "Electrode"),
    Pokemon(name: "Exeggcute"),
    Pokemon(name: "Exeggutor"),
    Pokemon(name: "Cubone"),
    Pokemon(name: "Marowak"),
    Pokemon(name: "Hitmonlee"),
    Pokemon(name: "Hitmonchan"),
    Pokemon(name: "Lickitung"),
    Pokemon(name: "Koffing"),
    Pokemon(name: "Weezing"),
    Pokemon(name: "Rhyhorn"),
    Pokemon(name: "Rhydon"),
    Pokemon(name: "Chansey"),
    Pokemon(name: "Tangela"),
    Pokemon(name: "Kangaskhan"),
    Pokemon(name: "Horsea"),
    Pokemon(name: "Seadra"),
    Pokemon(name: "Goldeen"),
    Pokemon(name: "Seaking"),
    Pokemon(name: "Staryu"),
    Pokemon(name: "Starmie"),
    Pokemon(name: "Mr. Mime"),
    Pokemon(name: "Scyther"),
    Pokemon(name: "Jynx"),
    Pokemon(name: "Electabuzz"),
    Pokemon(name: "Magmar"),
    Pokemon(name: "Pinsir"),
    Pokemon(name: "Tauros"),
    Pokemon(name: "Magikarp"),
    Pokemon(name: "Gyarados"),
    Pokemon(name: "Lapras"),
    Pokemon(name: "Ditto"),
    Pokemon(name: "Eevee"),
    Pokemon(name: "Vaporeon"),
    Pokemon(name: "Jolteon"),
    Pokemon(name: "Flareon"),
    Pokemon(name: "Porygon"),
    Pokemon(name: "Omanyte"),
    Pokemon(name: "Omastar"),
    Pokemon(name: "Kabuto"),
    Pokemon(name: "Kabutops"),
    Pokemon(name: "Aerodactyl"),
    Pokemon(name: "Snorlax"),
    Pokemon(name: "Articuno"),
    Pokemon(name: "Zapdos"),
    Pokemon(name: "Moltres"),
    Pokemon(name: "Dratini"),
    Pokemon(name: "Dragonair"),
    Pokemon(name: "Dragonite"),
    Pokemon(name: "Mewtwo"),
    Pokemon(name: "Mew")
]

struct ListView: View {
    @State private var searchText: String = ""
    
    var filteredPokemon: [Pokemon] {
        if searchText.isEmpty {
            return pokemon
        } else {
            return pokemon.filter {$0.name.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(filteredPokemon, id: \.id) { pokemon in
                        NavigationLink(destination: DetailView(pokemon: pokemon)) {
                            Text(pokemon.name)
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("All Pokemon")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: "Search for a Pokemon")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
