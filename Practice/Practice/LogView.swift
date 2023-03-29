//
//  LogView.swift
//  Practice
//
//  Created by Matthew Mukai on 3/29/23.
//

import SwiftUI

struct LogView: View {
    @Binding var habit: Habit
    let calendarView = Calendar(identifier: .gregorian)
//    let gregorianCalendar = Calendar(identifier: .gregorian)
    
    var body: some View {
        MultiDatePicker(
                "Start Date",
                selection: $habit.log
            )
        .datePickerStyle(.graphical)
        
    }
}

func isDateCompleted(date: Date)->Bool{
    return true
}


struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        let habit = Habit.sampleData[0][0]
        LogView(habit: .constant(habit))
    }
}
