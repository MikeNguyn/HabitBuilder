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
    var start: Date
    var end: Date
    var frequency: [Bool]
    var health: Double
    var importance: Int
    var empty: Bool
    
    init(id: UUID = UUID(), name: String, plant: Plant, start: Date, end: Date, frequency: [Bool], health: Double, importance: Int, empty: Bool) {
        self.id = id
        self.name = name
        self.plant = plant
        self.start = start
        self.end = end
        self.health = health
        self.importance = importance
        self.frequency = frequency
        self.empty = empty
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
    }
    
    var data: Data {
        Data(name: name, plant: plant, start: start, end: end, frequency: frequency, health: health, importance: importance)
    }
}


//Habit extention is used for making images an identifiable to be used in Pickers
extension Habit {
    enum Plant: String, Identifiable, CaseIterable {
        case blueberry
        case orchid
        case tomato
        case banana
        case corn
        case sunflower
        case pea
    
        var image: Image {
            switch self {
                case .blueberry: return Image("blueberryPlant")
                case .orchid: return Image("orchidPlant")
                case .tomato: return Image("tomatoPlant")
                case .banana: return Image("bananaemoji")
                case .sunflower: return Image("sunflowerPlant")
                case .corn: return Image("cornPlant")
                case .pea: return Image("peaPlant")
            }
        }

        var id: String{
            return self.rawValue
        }
        
        var data: [Plant] {
            return [.blueberry, .orchid, .tomato, .banana, .corn, .sunflower, .pea]
        }
    }
}
 

//Sample data we use to display/test
extension Habit {
    static let sampleData: [[Habit]] = [[Habit(name: "Drinking Water", plant: .banana, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 1.0, importance: 2, empty: false),
                                      Habit(name: "Drinking Wine", plant: .tomato, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.85, importance: 1, empty: false),
                                      Habit(name: "Exercise", plant: .blueberry, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.40, importance: 3, empty: false)],
                                      [Habit(name: "Water Plants", plant: .orchid, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.0, importance: 2, empty: false),
                                      Habit(name: "Shower", plant: .blueberry, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.60, importance: 1, empty: false),
                                      Habit(name: "Wash Laundry", plant: .orchid, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.29, importance: 1, empty: false)],
                                      [Habit(name: "Tell a joke", plant: .banana, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.82, importance: 2, empty: false),
                                      Habit(name: "Take Medicine", plant: .tomato, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.90, importance: 3, empty: false),
                                      Habit(name: "Make bed", plant: .corn, start: Date(), end: Date(), frequency: [false, false, false, false, false, false, false], health: 0.50, importance:1, empty: false)]
                                      
        ]
}

