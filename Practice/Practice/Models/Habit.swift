//
//  Habit.swift
//  Practice
//
//  Created by Minh Nguyen on 2/22/23.
//
//  A Data class for a Habit. Comprised of the attributes of any habit object.

import Foundation
import SwiftUI

struct Habit: Identifiable {
    let id: UUID
    var name: String
    var plant: Plant
    var end: Date
    var frequency: [Bool]
    var health: Double
    var importance: Int
    var empty: Bool
    
    init(id: UUID = UUID(), name: String, plant: Plant, end: Date, frequency: [Bool], health: Double, importance: Int, empty: Bool) {
        self.id = id
        self.name = name
        self.plant = plant
        self.end = end
        self.health = health
        self.importance = importance
        self.frequency = frequency
        self.empty = empty
    }
    init (id: UUID = UUID()){
        self.id = id
        self.name = ""
        self.plant = .rose
        self.end = Date()
        self.health = 0
        self.importance = 1
        self.frequency = [false, false, false, false, false, false, false]
        self.empty = true
    }
}

extension Habit {
    struct Data {
        var name: String
        var plant: Plant
        var end: Date
        var frequency: [Bool]
        var health: Double
        var importance: Int
    }
    
    var data: Data {
        Data(name: name, plant: plant, end: end, frequency: frequency, health: health, importance: importance)
    }
}


//Habit extention is used for making images an identifiable to be used in Pickers
extension Habit {
    enum Plant: String, Identifiable, CaseIterable {
        case rose
        case cactus
        case tomato
        case banana
        case corn
        case sunflower
        case pea
    
        var image: Image {
            switch self {
                case .rose: return Image("roseemoji")
                case .cactus: return Image("cactusemoji")
                case .tomato: return Image("tomatoemoji")
                case .banana: return Image("bananaemoji")
                case .sunflower: return Image("sunfloweremoji")
                case .corn: return Image("cornemoji")
                case .pea: return Image("peaemoji")
            }
        }

        var id: String{
            return self.rawValue
        }
        
        var data: [Plant] {
            return [.rose, .cactus, .tomato, .banana, .corn, .sunflower, .pea]
        }
    }
}
 

//Sample data we use to display/test
extension Habit {
    static let sampleData: [[Habit]] = [[Habit(name: "Drinking Water", plant: .banana, end: Date(), frequency: [false, false, false, false, false, false, false], health: 1.0, importance: 2, empty: false),
                                      Habit(name: "Drinking Wine", plant: .tomato, end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.85, importance: 1, empty: false),
                                      Habit(name: "Exercise", plant: .rose, end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.40, importance: 3, empty: false)],
                                      [Habit(name: "Water Plants", plant: .cactus, end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.0, importance: 2, empty: false),
                                      Habit(name: "Shower", plant: .rose, end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.60, importance: 1, empty: false),
                                      Habit(name: "Wash Laundry", plant: .cactus, end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.29, importance: 1, empty: false)],
                                      [Habit(name: "Tell a joke", plant: .banana, end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.82, importance: 2, empty: false),
                                      Habit(name: "Take Medicine", plant: .tomato, end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.90, importance: 3, empty: false),
                                      Habit(name: "Make bed", plant: .corn, end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.50, importance:1, empty: false)]
                                      
        ]
}

