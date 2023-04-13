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

var stageGlobal = 1

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
    var stage: Int
    
    init(id: UUID = UUID(), name: String, plant: Plant, start: Date, end: Date, frequency: [Bool], health: Double, importance: Int, empty: Bool, log: Set<DateComponents>, age: Int, stage: Int) {
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
        self.stage = stage
        
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
        self.log = [DateComponents(year: 2023, month: 3, day: 29)]
        self.age = 3
        self.stage = 1
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
        var stage: Int
    }
    
    var data: Data {
        Data(name: name, plant: plant, start: start, end: end, frequency: frequency, health: health, importance: importance, empty: empty, log: log, age: age, stage: stage)
    }
}


//Habit extention is used for making images an identifiable to be used in Pickers
extension Habit {
//    var imageStage = stage
    enum Plant: String, Identifiable, CaseIterable, Codable {
        case blueberry
        case orchid
        case tomato
        case corn
        case sunflower
        case pea
        
//        case blueberry2
//        case orchid2
//        case tomato2
//        case corn2
//        case sunflower2
//        case pea2
//
//        case blueberry3
//        case orchid3
//        case tomato3
//        case corn3
//        case sunflower3
//        case pea3
        
    
        var image: Image {
            switch self {
                case .blueberry: return checkPlantGrowth(plantName: "blueberryPlant", plantStage: stageGlobal)
            case .orchid: return checkPlantGrowth(plantName: "orchidPlant", plantStage: stageGlobal)
            case .tomato: return checkPlantGrowth(plantName: "tomatoPlant", plantStage: stageGlobal)
            case .sunflower: return checkPlantGrowth(plantName: "sunflowerPlant", plantStage: stageGlobal)
            case .corn: return checkPlantGrowth(plantName: "cornPlant", plantStage: stageGlobal)
            case .pea: return checkPlantGrowth(plantName: "peaPlant", plantStage: stageGlobal)
//                case .blueberry: return Image("blueberryPlantSmall")
//                case .orchid: return Image("orchidPlantSmall")
//                case .tomato: return Image("tomatoPlantSmall")
//                case .sunflower: return Image("sunflowerPlantSmall")
//                case .corn: return Image("cornPlantSmall")
//                case .pea: return Image("peaPlantSmall")
//
//                case .blueberry2: return Image("blueberryPlantMed")
//                case .orchid2: return Image("orchidPlantMed")
//                case .tomato2: return Image("tomatoPlantMed")
//                case .sunflower2: return Image("sunflowerPlantMed")
//                case .corn2: return Image("cornPlantMed")
//                case .pea2: return Image("peaPlantMed")
//
//                case .blueberry3: return Image("blueberryPlantFull")
//                case .orchid3: return Image("orchidPlantFull")
//                case .tomato3: return Image("tomatoPlantFull")
//                case .sunflower3: return Image("sunflowerPlantFull")
//                case .corn3: return Image("cornPlantFull")
//                case .pea3: return Image("peaPlantFull")
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

extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
    
    func shiftDate(shift: Int) -> Date? {
        return Calendar.current.date(byAdding: .day, value: shift, to: self)
    }
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = Calendar.current.startOfDay(for: from)
        let toDate = Calendar.current.startOfDay(for: to)
        let numberOfDays = Calendar.current.dateComponents([.day], from: fromDate, to: toDate)
        
        return numberOfDays.day! + 1 // <1>
    }
 
func checkPlantGrowth(plantName: String, plantStage: Int)->Image{
    var suffix = "Small"
    if (plantStage == 2){
        suffix = "Med"
    } else if (plantStage == 3){
        suffix = "Full"
    }
    var imageName = plantName + suffix
    return Image(imageName)
}

//Sample data we use to display/test
extension Habit {
    static let sampleData: [[Habit]] = [[Habit(name: "Drinking Water", plant: .sunflower, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 1.0, importance: 2, empty: false, log: datesForLog, age: 0, stage:1),
                                         Habit(name: "Drinking Wine", plant: .tomato, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.85, importance: 1, empty: false, log: datesForLog, age: 0,stage: 1),
                                      Habit(name: "Exercise", plant: .blueberry, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.40, importance: 3, empty: false, log: datesForLog, age: 0,stage: 2)],
                                      [Habit(name: "Water Plants", plant: .orchid, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.0, importance: 2, empty: false, log: datesForLog, age: 0,stage: 2),
                                      Habit(name: "Shower", plant: .blueberry, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.60, importance: 1, empty: false, log: datesForLog, age: 0,stage: 2),
                                      Habit(name: "Wash Laundry", plant: .orchid, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.29, importance: 1, empty: false, log: datesForLog, age: 0,stage: 3)],
                                      [Habit(name: "Tell a joke", plant: .corn, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.82, importance: 2, empty: false, log: datesForLog, age: 0,stage: 3),
                                      Habit(name: "Take Medicine", plant: .tomato, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.90, importance: 3, empty: false, log: datesForLog, age: 0,stage: 3),
                                      Habit()]
]
}

