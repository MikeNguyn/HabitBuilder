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
    var end: Date
    var frequency: [Bool]
    var health: Double
    var importance: Int
    
    init(id: UUID = UUID(), name: String, plant: Image, end: Date, frequency: [Bool], health: Double, importance: Int) {
        self.id = id
        self.name = name
        self.plant = plant
        self.end = end
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
        var name: String
        var plant: Image
        var end: Date
        var frequency: [Bool]
        var health: Double
        var importance: Int
    }
    
    var data: Data {
        Data(name: name, plant: plant, end: end, frequency: frequency, health: health, importance: importance)
    }
}

extension Habit {
    enum Plant: String, Identifiable {
        case rose
        case cactus
        case tomato
        case banana
        case corn
        case sunflower
        case trowel
    
        var image: Image {
            switch self {
                case .rose: return Image("roseemoji")
                case .cactus: return Image("cactusemoji")
                case .tomato: return Image("tomatoemoji")
                case .banana: return Image("bananaemoji")
                case .trowel: return Image("trowelemoji")
                case .sunflower: return Image("sunfloweremoji")
                case .corn: return Image("cornemoji")
            }
        }

        var id: String{
            return self.rawValue
        }
    }
}
    
extension Habit {
    static let sampleData: [Habit] = [Habit(name: "Drinking Water", plant: Image("bananaemoji"), end: Date(), frequency: [false, false, false, false, false, false, false], health: 1.0, importance: 2),
                                      Habit(name: "Drinking Wine", plant: Image("tomatoemoji"), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.85, importance: 1),
                                      Habit(name: "Exercise", plant: Image("roseemoji"), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.40, importance: 3),
                                      Habit(name: "Water Plants", plant: Image("cactusemoji"), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.0, importance: 2),
                                      Habit(name: "Shower", plant: Image("roseemoji"), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.60, importance: 1),
                                      Habit(name: "Wash Laundry", plant: Image("cactusemoji"), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.29, importance: 1),
                                      Habit(name: "Tell a joke", plant: Image("bananaemoji"), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.82, importance: 2),
                                      Habit(name: "Take Medicine", plant: Image("tomatoemoji"), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.90, importance: 3),
                                      Habit(name: "Make bed", plant: Image("bananaemoji"), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.50, importance:1)
                                      
        ]
}

