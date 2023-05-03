//
//  PracticeApp.swift
//  Practice
//
//  Created by Matthew Mukai on 2/8/23.
//

import SwiftUI


//This is the main class of our app that is ran when we run the application. This initiates the SplashView/loading screen.
@main
struct PracticeApp: App {
    @StateObject private var store = HabitStore()
    var body: some Scene {
        @State var loading = true
        WindowGroup {
            SplashView()
        }
    }
}
