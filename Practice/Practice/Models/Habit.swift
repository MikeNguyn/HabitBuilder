//
//  Habit.swift
//  Practice
//
//  Created by Minh Nguyen on 2/22/23.
//

import Foundation
import SwiftUI

struct Habit: Identifiable {
    let id: UUID
    var name: String
    var plant: Image
    var length: Int
    var frequency: Log
    var health: Double
    var importance: Int
    
    init(id: UUID = UUID(), name: String, plant: Image, length: Int, frequency: Log, health: Double,importance: Int) {
        self.id = id
        self.name = name
        self.plant = plant
        self.length = length
        self.health = health
        self.importance = importance
        self.frequency = frequency
    }
}

extension Habit {
    struct Log: Identifiable {
        let id: UUID
        var interactions = [Date()]
        
        init(id: UUID =  UUID(), interactions: [ Date ]) {
            self.id = id
            self.interactions = interactions
        }
    }
    struct Data {
        var name: String = "Drinking water"
        var plant: Image = Image("bananaemoji")
        var length: Int = 30
        var frequency: Log = Log(interactions: [])
        var health: Double = 1.0
        var importance: Int = 3
    }
    
    var data: Data {
        Data(name: name, plant: plant, length: length, frequency: frequency, health: health, importance: importance)
    }
}
    
extension Habit {
    static let sampleData: [Habit] = [Habit(name: "Drinking Water", plant: Image("bananaemoji"), length: 30, frequency: Log(interactions: []), health: 1.0, importance: 2),
                                      Habit(name: "Drinking Wine", plant: Image("tomatoemoji"), length: 20, frequency: Log(interactions: []), health: 0.85, importance: 1),
                                      Habit(name: "Exercise", plant: Image("roseemoji"), length: 16, frequency: Log(interactions: []), health: 0.40, importance: 3)
        ]
}

