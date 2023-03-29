//
//  Habit.swift
//  Practice
//
//  Created by Minh Nguyen on 2/22/23.
//
//  A Data class for a Habit. Comprised of the attributes of any habit object.

import Foundation
import SwiftUI

let dateComponentsArray = [
    DateComponents(year: 2023, month: 3, day: 29),
    DateComponents(year: 2023, month: 3, day: 5),
    DateComponents(year: 2023, month: 5, day: 15),
    DateComponents(year: 2023, month: 6, day: 20),
    DateComponents(year: 2023, month: 3, day: 10),
    DateComponents(year: 2023, month: 4, day: 9),
    DateComponents(year: 2023, month: 4, day: 24),
    DateComponents(year: 2023, month: 4, day: 2),
    DateComponents(year: 2023, month: 4, day: 15),
    DateComponents(year: 2023, month: 3, day: 12),
    DateComponents(year: 2023, month: 3, day: 13),
    DateComponents(year: 2023, month: 3, day: 14),
    DateComponents(year: 2023, month: 3, day: 15),
    DateComponents(year: 2023, month: 3, day: 28),
    DateComponents(year: 2023, month: 3, day: 27),
    DateComponents(year: 2023, month: 3, day: 24),
    DateComponents(year: 2023, month: 3, day: 31)
]

var datesForLog = Set(dateComponentsArray)

struct Habit: Identifiable {
    let id: UUID
    var name: String
    var plant: Plant
    var start: Date
    var end: Date
    var frequency: [Bool]
    var health: Double
    var importance: Int
    var empty: Bool
    var log: Set<DateComponents>
    
    init(id: UUID = UUID(), name: String, plant: Plant, start: Date, end: Date, frequency: [Bool], health: Double, importance: Int, empty: Bool, log: Set<DateComponents>) {
        self.id = id
        self.name = name
        self.plant = plant
        self.start = start
        self.end = end
        self.health = health
        self.importance = importance
        self.frequency = frequency
        self.empty = empty
        self.log = log
    }
    init (id: UUID = UUID()){
        self.id = id
        self.name = ""
        self.plant = .rose
        self.start = Date()
        self.end = Date()
        self.health = 0
        self.importance = 1
        self.frequency = [false, false, false, false, false, false, false]
        self.empty = true
        self.log = []
    }
}

extension Habit {
    struct Data {
        var name: String
        var plant: Plant
        var start: Date
        var end: Date
        var frequency: [Bool]
        var health: Double
        var importance: Int
        var empty: Bool
        var log: Set<DateComponents>
    }
    
    var data: Data {
        Data(name: name, plant: plant, start: start, end: end, frequency: frequency, health: health, importance: importance, empty: empty, log: log)
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
    static let sampleData: [[Habit]] = [[Habit(name: "Drinking Water", plant: .banana, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 1.0, importance: 2, empty: false, log: datesForLog),
                                      Habit(name: "Drinking Wine", plant: .tomato, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.85, importance: 1, empty: false,log: datesForLog),
                                      Habit(name: "Exercise", plant: .rose, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.40, importance: 3, empty: false,log: datesForLog)],
                                      [Habit(name: "Water Plants", plant: .cactus, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.0, importance: 2, empty: false,log: datesForLog),
                                      Habit(name: "Shower", plant: .rose, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.60, importance: 1, empty: false,log: datesForLog),
                                      Habit(name: "Wash Laundry", plant: .cactus, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.29, importance: 1, empty: false,log: datesForLog)],
                                      [Habit(name: "Tell a joke", plant: .banana, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.82, importance: 2, empty: false,log: datesForLog),
                                      Habit(name: "Take Medicine", plant: .tomato, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.90, importance: 3, empty: false,log: datesForLog),
                                      Habit(name: "Make bed", plant: .corn, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.50, importance:1, empty: false,log: datesForLog)]
                                      
        ]
}

