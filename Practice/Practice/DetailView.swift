//
//  DetailView.swift
//  Practice
//
//  Created by Minh Nguyen on 2/20/23.
//

import SwiftUI

struct DetailView: View {
    let habit : Habit
    
    var body: some View {
        List{
            Section(header: Text("Content Detail")){
                HStack {
                    Label("Name", systemImage: "clock")
                    Spacer()
                    Text(habit.name)
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var habit = Habit.sampleData[2]
    static var previews: some View {
        DetailView(habit: habit)
    }
}
