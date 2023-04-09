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
        self.plant = .blueberry3
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
        case blueberry1
        case orchid1
        case tomato1
        case corn1
        case sunflower1
        case pea1
        
        case blueberry2
        case orchid2
        case tomato2
        case corn2
        case sunflower2
        case pea2
        
        case blueberry3
        case orchid3
        case tomato3
        case corn3
        case sunflower3
        case pea3
    
        var image: Image {
            switch self {
                case .blueberry1: return Image("blueberryPlantSmall")
                case .orchid1: return Image("orchidPlantSmall")
                case .tomato1: return Image("tomatoPlantSmall")
                case .sunflower1: return Image("sunflowerPlantSmall")
                case .corn1: return Image("cornPlantSmall")
                case .pea1: return Image("peaPlantSmall")
                
                case .blueberry2: return Image("blueberryPlantMed")
                case .orchid2: return Image("orchidPlantMed")
                case .tomato2: return Image("tomatoPlantMed")
                case .sunflower2: return Image("sunflowerPlantMed")
                case .corn2: return Image("cornPlantMed")
                case .pea2: return Image("peaPlantMed")
                
                case .blueberry3: return Image("blueberryPlantFull")
                case .orchid3: return Image("orchidPlantFull")
                case .tomato3: return Image("tomatoPlantFull")
                case .sunflower3: return Image("sunflowerPlantFull")
                case .corn3: return Image("cornPlantFull")
                case .pea3: return Image("peaPlantFull")
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
            return [.blueberry1, .orchid1, .tomato1, .corn1, .sunflower1, .pea1,.blueberry2, .orchid2, .tomato2, .corn2, .sunflower2, .pea2,.blueberry3, .orchid3, .tomato3, .corn3, .sunflower3, .pea3]
        }
    }
}
 

//Sample data we use to display/test
extension Habit {
    static let sampleData: [[Habit]] = [[Habit(name: "Drinking Water", plant: .sunflower3, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 1.0, importance: 2, empty: false, log: datesForLog, age: 0),
                                      Habit(name: "Drinking Wine", plant: .tomato3, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.85, importance: 1, empty: false, log: datesForLog, age: 0),
                                      Habit(name: "Exercise", plant: .blueberry3, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.40, importance: 3, empty: false, log: datesForLog, age: 0)],
                                      [Habit(name: "Water Plants", plant: .orchid3, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.0, importance: 2, empty: false, log: datesForLog, age: 0),
                                      Habit(name: "Shower", plant: .blueberry3, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.60, importance: 1, empty: false, log: datesForLog, age: 0),
                                      Habit(name: "Wash Laundry", plant: .orchid3, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.29, importance: 1, empty: false, log: datesForLog, age: 0)],
                                      [Habit(name: "Tell a joke", plant: .corn3, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.82, importance: 2, empty: false, log: datesForLog, age: 0),
                                      Habit(name: "Take Medicine", plant: .tomato3, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.90, importance: 3, empty: false, log: datesForLog, age: 0),
                                      Habit()]
]
}

