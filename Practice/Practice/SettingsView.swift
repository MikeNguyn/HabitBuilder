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
        NavigationView{
            List{
                Section(header: Text("Habit Garden Settings")){
                    HStack {
                        Text("Clear the Entire Garden?")
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
                                let notificationCenter = UNUserNotificationCenter.current()
                                notificationCenter.removeAllPendingNotificationRequests()
                            }
                        }
                    }
                    HStack{
                        Text("Open Notification Settings")
                        Spacer()
                        Button {
                            if let appSettings = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(appSettings) {
                                UIApplication.shared.open(appSettings)
                            }
                        } label: {
                            Image(systemName: "arrow.up.right.circle.fill")
                        }
                    }
                    
                }
            }.navigationTitle("Settings")
        }
        
        
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(habitList: .constant(Habit.sampleData))
    }
}
