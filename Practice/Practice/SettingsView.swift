//
//  SettingsView.swift
//  Practice
//
//  Created by Matthew Mukai on 4/26/23.
//

import SwiftUI

struct SettingsView: View {
    @Binding var habitList: [[Habit]]
    @State private var isPresentingConfirm = false
    var body: some View {
        List{
            Section(header: Text("Habit Garden Settings")){
                HStack {
                    Label("Clear the Entire Garden?", systemImage: "flame.fill")
                    Spacer()
                    Button("X", role: .destructive) {
                        isPresentingConfirm = true
                    }
                    .controlSize(.mini)
                    .padding(5)
                        .background(Color.black)
                        .clipShape(Circle())
//                        .padding(.trailing, 20)
                    
                    .confirmationDialog("Are you sure?",
                      isPresented: $isPresentingConfirm) {
                      Button("Delete the entire garden?", role: .destructive) {
                          habitList =
                             [[Habit(), Habit(), Habit()],
                              [Habit(), Habit(), Habit()],
                              [Habit(), Habit(), Habit()]]
                        }
                    }
                }
                HStack{
                    Text("add section to turn on notifications")
                }
                
            }
        }
        
        
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(habitList: .constant(Habit.sampleData))
    }
}
