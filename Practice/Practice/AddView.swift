//
//  AddView.swift
//  Practice
//
//  Created by Minh Nguyen on 2/25/23.
//

import SwiftUI

struct AddView: View {
    @State var tempName: String = ""
    @State var date: Date = Date()
    var body: some View {
        List{
            HStack{
                Text("Habit name")
                Spacer()
                TextField("Habit", text: $tempName)
            }
            HStack{
                DatePicker(
                    "Starting Date",
                    selection: $date,
                    displayedComponents: [.date])
                .datePickerStyle(.wheel)
            }
            HStack {
                Text("Tree")
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    
    static var previews: some View {
        AddView()
    }
}
