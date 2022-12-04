//
//  PokeMove.swift
//  Pokedex
//
//  Created by Daniel Basaldua on 12/3/22.
//

import Foundation

struct PokeMove: Identifiable {
    let id = UUID()
    let lvl: Int
    let name: String
    let type: String
    let power: Int
    let pp: Int
}
