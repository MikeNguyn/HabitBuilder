//
//  PracticeApp.swift
//  Practice
//
//  Created by Matthew Mukai on 2/8/23.
//

import SwiftUI

@main
struct PracticeApp: App {
    var body: some Scene {
        WindowGroup {
            var habitManager = HabitManager()
            ContentView(habitList: habitManager.getData())
        }
    }
}
