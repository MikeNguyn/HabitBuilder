//
//  PracticeApp.swift
//  Practice
//
//  Created by Matthew Mukai on 2/8/23.
//

import SwiftUI

@main
struct PracticeApp: App {
    //    @State var habitManager = HabitManager()
    @StateObject private var store = HabitStore()
    var body: some Scene {
        WindowGroup {
            ContentView(habitList: $store.habits) {
                HabitStore.save(habits: store.habits) { result in
                    if case .failure(let error) = result {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .onAppear {
                HabitStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let habits):
                        store.habits = habits
                    }
                }
            }
        }
    }
}
