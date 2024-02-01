//
//  InterestingTesting.swift
//  TDD2
//
//  Created by Tyler May on 2/1/24.
//

import Foundation

// Single Responsibility Principle

protocol Shoe {
    func saveSize(_ shoeSize: Int)
    
}

class BigFootShoe: Shoe {
    func saveSize(_ shoeSize: Int) {
        //save shoe size
    }
    
}


// Open/Closed Principle

protocol Game {
    func runGame()
}

class Rainbow6Siege: Game {
    func runGame() {
        //run game
    }
}

class Minecraft: Game {
    func runGame() {
        // run game
    }
    
}

class PlayGame {
    let game: Game
    
    init(game: Game) {
        self.game = game
    }
    
    func playGame() {
        game.runGame()
    }
}

// Liskov Substitution Principle

class SuperGmae: PlayGame {
    var device: String
    
    init(device: String, game: Game) {
        self.device = device
        super.init(game: game)
    }
    
}

// Interface Segergation Principle

protocol FourLegs {
    func runOnFour()
}

protocol TwoLegs {
    func runOnTwo()
}

class Human: TwoLegs {
    func runOnTwo() {
        print("running on two legs")
    }
    
}

class Bear: FourLegs {
    func runOnFour() {
        print("running on all four")
    }
    
}

class Monkey: Human, FourLegs {
    func runOnFour() {
        print("Using hands to help run")
    }
}

// Dependancy Inversion Principle
protocol DataStore {
    func save(_ data: String)
    func fetch() -> String
}

class Database: DataStore {
    func save(_ data: String) {
        print("Saving data to database: \(data)")
    }
    func fetch() -> String {
        return "Fetched data from database"
    }
}

class FileSystem: DataStore {
    func save(_ data: String) {
        print("Saving data to file system: \(data)")
    }
    func fetch() -> String {
        return "Fetched data from file system"
    }
}

class Logger {
    private let dataStore: DataStore
    init(dataStore: DataStore) {
        self.dataStore = dataStore
    }

    func log(_ data: String) {
        dataStore.save(data)
        print("Data logged: \(data)")
    }
}



