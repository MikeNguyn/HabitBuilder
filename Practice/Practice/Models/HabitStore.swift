//
//  HabitStore.swift
//  Practice
//
//  Created by Minh Nguyen on 4/2/23.
//

import Foundation
import SwiftUI

//Habit Store takes in our list of list of habits. Then it will save this data in a URL. When we are reloading the app we will pull from this url to get our saved habit data.

class HabitStore: ObservableObject {
    @Published var habits: [[Habit]] =
    [[Habit(), Habit(), Habit()], [Habit(), Habit(), Habit()], [Habit(), Habit(), Habit()]]
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil,
        create: false)
        .appendingPathComponent("habits2.data")
       }
    
    static func load(completion: @escaping (Result<[[Habit]], Error>)->Void) {
            DispatchQueue.global(qos: .background).async {
                do {
                    let fileURL = try fileURL()
                    guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                        DispatchQueue.main.async {
                            completion(.success([[Habit(), Habit(), Habit()], [Habit(), Habit(), Habit()], [Habit(), Habit(), Habit()]]))
                        }
                        return
                    }
                    let dailyHabit = try JSONDecoder().decode([[Habit]].self, from: file.availableData)
                    DispatchQueue.main.async {
                        completion(.success(dailyHabit))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
        }
    static func save(habits: [[Habit]], completion: @escaping (Result<Int, Error>)->Void) {
            DispatchQueue.global(qos: .background).async {
                do {
                    let data = try JSONEncoder().encode(habits)
                    let outfile = try fileURL()
                    try data.write(to: outfile)
                    DispatchQueue.main.async {
                        completion(.success(habits.count))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
        }
}
