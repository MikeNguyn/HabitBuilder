//
//  SettingsView.swift
//  Practice
//
//  Created by Matthew Mukai on 4/26/23.
//

import SwiftUI

//This settings view has two main functions. The first is the clear the entire garden of habits. The second is to open notification settings to toggle them on/off.

struct SettingsView: View {
    @Binding var habitList: [[Habit]]
    @State private var isPresentingConfirm = false
    var body: some View {
        List{
            Section(header: Text("Habit Garden Settings")){
                HStack {
                    //This is the clear garden section
                    Text("Clear the Entire Garden?")
                    Spacer()
                    Button("X", role: .destructive) {
                        isPresentingConfirm = true
                    }
                    .controlSize(.mini)
                    .padding(5)
                        .background(Color.black)
                        .clipShape(Circle())
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
                //This triggers the opening of settings
//got help from https://stackoverflow.com/questions/42848539/opening-apps-notification-settings-in-the-settings-app
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
        }
        
        
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(habitList: .constant(Habit.sampleData))
    }
}
