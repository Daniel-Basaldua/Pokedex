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
}
