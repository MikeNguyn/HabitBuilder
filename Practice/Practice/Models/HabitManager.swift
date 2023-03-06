//
//  HabitManager.swift
//  Practice
//
//  Created by Minh Nguyen on 2/25/23.
//
//Initialize the habit list to be full of trowels (icon to add new plants)

import Foundation
import SwiftUI

struct HabitManager: Identifiable{
    var id: UUID
    var habits: [Habit]
    
    init(id: UUID = UUID()) {
        self.id = id
        self.habits = Array(repeating: Habit(name: "", plant: Image("trowelemoji"), length: 0, frequency: Habit.Log(interactions: []), health: 0, importance: 0), count: 9)
    }
}

extension HabitManager {
    mutating func add(habit: Habit, position: Int) {
        habits.insert(habit, at: position)
    }
    
    func getData() -> [Habit]{
        return habits
    }
}
