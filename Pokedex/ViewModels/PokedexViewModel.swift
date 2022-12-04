//
//  PokedexViewModel.swift
//  Pokedex
//
//  Created by Daniel Basaldua on 12/2/22.
//

import Foundation
import PostgresNIO
import NIOPosix
import Logging


class PokedexViewModel: ObservableObject {
    @Published var pokemon: [Pokemon] = []
    
    var connection: PostgresConnection?
    let eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    let logger = Logger(label: "postgres-logger")
    let config = PostgresConnection.Configuration(
       connection: .init(
         host: "localhost",
         port: 5432
       ),
       authentication: .init(
         username: "danielbasaldua",
         database: "pokemon",
         password: "my_password"
       ),
       tls: .disable
    )
    
    @MainActor
    func establishConnection() async -> Bool {
        do {
            self.connection = try await PostgresConnection.connect(
                on: eventLoopGroup.next(),
                configuration: config,
                id: 1,
                logger: logger
            )
            print("Connection to pokemon database established.")
            return true
        } catch {
            print("Connection to the pokemon database could not be established.")
            return false
        }
    }
    
    @MainActor
    func loadPokemonFromDB() async -> Bool {
        do {
            let rows = try await connection?.query("SELECT * FROM pokemon;", logger: self.logger)
            for try await (_, name, type_one, type_two) in rows!.decode((Int, String, String, String?).self, context: .default) {
                pokemon.append(Pokemon(name: name, type_one: type_one, type_two: type_two))
            }
            print("Pokemon loaded.")
            return true
        } catch {
            print("Pokemon could not be loaded.")
            return false
        }
    }
    
    @MainActor
    func getStats(name: String) async -> [Int]{
        var temp: [Int] = [-1, -1, -1, -1, -1, -1, -1]
        do {
            let queryString = "SELECT hp, atk, def, spatk, spdef, special, total FROM pokemon, stats WHERE pokemon.id = stats.id AND pokemon.name = '\(name)';"
            let pq = PostgresQuery(stringLiteral: queryString)
            let rows = try await connection?.query(pq, logger: self.logger)
            for try await (hp, atk, def, spAtk, spDef, special, total) in rows!.decode((Int, Int, Int, Int, Int, Int, Int).self, context: .default) {
                temp = [hp, atk, def, spAtk, spDef, special, total]
            }
            print("Pokemon stats for \(name) loaded.")
        } catch {
            print("Pokemon stats for \(name) could not be loaded.")
        }
        return temp
    }
    
    @MainActor
    func getMoves(name: String) async -> [PokeMove]{
        var temp: [PokeMove] = []
        do {
            let queryString = "SELECT DISTINCT learns.level, moves.name, moves.type, moves.power, moves.pp FROM pokemon, learns, moves WHERE pokemon.id = learns.pid AND learns.mid = moves.id AND pokemon.name = '\(name)' ORDER BY learns.level ASC;"
            let pq = PostgresQuery(stringLiteral: queryString)
            let rows = try await connection?.query(pq, logger: self.logger)
            for try await (lvl, name, type, power, pp) in rows!.decode((Int, String, String, Int, Int).self, context: .default) {
                temp.append(PokeMove(lvl: lvl, name: name, type: type, power: power, pp: pp))
            }
            print("Pokemon moves for \(name) loaded.")
        } catch {
            print("Pokemon moves for \(name) could not be loaded.")
        }
        return temp
    }
}
