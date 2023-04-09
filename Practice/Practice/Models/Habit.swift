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

struct Habit: Identifiable, Codable {
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
    var age: Int
    
    init(id: UUID = UUID(), name: String, plant: Plant, start: Date, end: Date, frequency: [Bool], health: Double, importance: Int, empty: Bool, log: Set<DateComponents>, age: Int) {
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
        self.age = age
        
    }
    init (id: UUID = UUID()){
        self.id = id
        self.name = ""
        self.plant = .blueberry
        self.start = Date()
        self.end = Date()
        self.health = 0
        self.importance = 1
        self.frequency = [false, false, false, false, false, false, false]
        self.empty = true
        self.log = []
        self.age = 0
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
        var age: Int
    }
    
    var data: Data {
        Data(name: name, plant: plant, start: start, end: end, frequency: frequency, health: health, importance: importance, empty: empty, log: log, age: age)
    }
}


//Habit extention is used for making images an identifiable to be used in Pickers
extension Habit {
    enum Plant: String, Identifiable, CaseIterable, Codable {
        case blueberry
        case orchid
        case tomato
        case corn
        case sunflower
        case pea
    
        var image: Image {
            switch self {
                case .blueberry: return Image("blueberryPlantFull")
                case .orchid: return Image("orchidPlantFull")
//                case .tomato: if(habit.tomato.age == 0) {
//                    return Image("tomatoPlantFull")
//                }
                case .tomato: return Image("tomatoPlantFull")
                case .sunflower: return Image("sunflowerPlantFull")
                case .corn: return Image("cornPlantFull")
                case .pea: return Image("peaPlantFull")
            }
        }
//        var imageHalf: Image {
//            switch self {
//            case .tomato: return Image("tomatoPlantMid")
//            }
//        }

        var id: String{
            return self.rawValue
        }
        
        var data: [Plant] {
            return [.blueberry, .orchid, .tomato, .corn, .sunflower, .pea]
        }
    }
}
 

//Sample data we use to display/test
extension Habit {
    static let sampleData: [[Habit]] = [[Habit(name: "Drinking Water", plant: .sunflower, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 1.0, importance: 2, empty: false, log: datesForLog, age: 0),
                                      Habit(name: "Drinking Wine", plant: .tomato, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.85, importance: 1, empty: false, log: datesForLog, age: 0),
                                      Habit(name: "Exercise", plant: .blueberry, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.40, importance: 3, empty: false, log: datesForLog, age: 0)],
                                      [Habit(name: "Water Plants", plant: .orchid, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.0, importance: 2, empty: false, log: datesForLog, age: 0),
                                      Habit(name: "Shower", plant: .blueberry, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.60, importance: 1, empty: false, log: datesForLog, age: 0),
                                      Habit(name: "Wash Laundry", plant: .orchid, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.29, importance: 1, empty: false, log: datesForLog, age: 0)],
                                      [Habit(name: "Tell a joke", plant: .corn, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.82, importance: 2, empty: false, log: datesForLog, age: 0),
                                      Habit(name: "Take Medicine", plant: .tomato, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.90, importance: 3, empty: false, log: datesForLog, age: 0),
                                      Habit()]
]
}

