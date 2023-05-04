//
//  Habit.swift
//  Practice
//
//  Created by Minh Nguyen on 2/22/23.
//
//  A Data class for a Habit. Comprised of the attributes of any habit object.

import Foundation
import SwiftUI

//This is a set of test date components for sample data if we want to have past log dates for a habit.
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

//These 3 arrays are used for different pickers. We want our addview picker to use plant images only at their oldest stage.
var plantCasesforPicker = [Plant(plant: "sunflower", stage: 1),Plant(plant: "blueberry", stage: 1),Plant(plant: "pea", stage: 1),Plant(plant: "orchid", stage: 1),Plant(plant: "corn", stage: 1),Plant(plant: "tomato", stage: 1),Plant(plant: "strawberry", stage: 1),Plant(plant: "carrot", stage: 1),Plant(plant: "eggplant", stage: 1)]

var plantCasesforPicker2 = [Plant(plant: "sunflower", stage: 2),Plant(plant: "blueberry", stage: 2),Plant(plant: "pea", stage: 2),Plant(plant: "orchid", stage: 2),Plant(plant: "corn", stage: 2),Plant(plant: "tomato", stage: 2),Plant(plant: "strawberry", stage: 2),Plant(plant: "carrot", stage: 2),Plant(plant: "eggplant", stage: 2)]

//the picker used for addview.
var plantCasesforPicker3 = [Plant(plant: "sunflower", stage: 3),Plant(plant: "blueberry", stage: 3),Plant(plant: "pea", stage: 3),Plant(plant: "orchid", stage: 3),Plant(plant: "corn", stage: 3),Plant(plant: "tomato", stage: 3),Plant(plant: "strawberry", stage: 3),Plant(plant: "carrot", stage: 3),Plant(plant: "eggplant", stage: 3)]

var datesForLog = Set(dateComponentsArray)

var stageGlobal = 1

//This stores all the properties we want for a specific habit.
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
        self.plant = Plant(plant: "tomato", stage: 3)
        self.start = Date()
        self.end = Date()
        self.health = 0
        self.importance = 1
        self.frequency = [false, false, false, false, false, false, false]
        self.empty = true
        self.log = []
        self.age = 0
        self.stage = 1
    }
    
    
}

//This extension allows us to pull variables/properties out of a habit.
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



//This date extension is used to calculate length of habits.
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
}
 
//This is sample habit data that we can use for testing and displaying.
extension Habit {
    static let sampleData: [[Habit]] = [[Habit(name: "Drinking Water", plant: Plant(plant: "sunflower", stage: 1), start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 1.0, importance: 2, empty: false, log: datesForLog, age: 0, stage:1),
                                         Habit(name: "Drinking Wine", plant: Plant(plant: "sunflower", stage: 1), start: Date(), end: Date(), frequency: [false, true, true, true, false, false, false], health: 0.85, importance: 1, empty: false, log: datesForLog, age: 0,stage: 1),
                                      Habit(name: "Exercise", plant: Plant(plant: "sunflower", stage: 1), start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.40, importance: 3, empty: false, log: datesForLog, age: 0,stage: 2)],
                                      [Habit(name: "Water Plants", plant: Plant(plant: "sunflower", stage: 1), start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.0, importance: 2, empty: false, log: datesForLog, age: 0,stage: 2),
                                      Habit(name: "Shower", plant: Plant(plant: "sunflower", stage: 1), start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.60, importance: 1, empty: false, log: datesForLog, age: 0,stage: 2),
                                      Habit(name: "Wash Laundry", plant: Plant(plant: "sunflower", stage: 1), start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.29, importance: 1, empty: false, log: datesForLog, age: 0,stage: 3)],
                                      [Habit(name: "Tell a joke", plant: Plant(plant: "sunflower", stage: 1), start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.82, importance: 2, empty: false, log: datesForLog, age: 0,stage: 3),
                                      Habit(name: "Take Medicine", plant: Plant(plant: "sunflower", stage: 1), start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.90, importance: 3, empty: false, log: datesForLog, age: 0,stage: 3),
                                      Habit()]
]
}
    


