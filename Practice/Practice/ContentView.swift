//
//  ContentView.swift
//  Practice
//
//  Created by Matthew Mukai on 2/8/23.
// Michael and Curran and Francesca
//The main front screen/page. It displays the main grid of plants and other icons.

import SwiftUI
import UserNotifications
let MENUICONSIZE = 60.0


//the main Habit display 3x3 grid
struct ContentView: View {
    @Binding var habitList: [[Habit]]
    @State var confirmationShow = false
    @State private var isPresentingConfirm: Bool = false
    @GestureState var isLongPressed = false
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: () -> Void
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink("Tutorial"){
                    ImageSlideShow(images: ["Tutss1", "Tutss1", "Tutss2", "Tutss3", "Tutss4","Tutss5", "Tutss6", "Tutss7", "Tutss8", "Tutss9", "Tutss10", "Tutss11", "Tutss12", "Tutss15", "Tutss16"])
                }
                Button("Request Permission") {
                    // requests permission from the user to send notifications. Click this first
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("All set!")
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                }
                //THIS HAS BEEN MOVED TO ADDVIEW
//                Button("Schedule Notification") {
//                    // creates the notification and schedules it to appear in 5 seconds. click this button second.
//                    let content = UNMutableNotificationContent()
//                    content.title = "Feed the cat"
//                    content.subtitle = "It looks hungry"
//                    content.sound = UNNotificationSound.default
//
//                    // show this notification five seconds from now
//                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//
//                    //choose a random identifier
//                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//
//                    // add our notification request
//                    UNUserNotificationCenter.current().add(request)
//                }
                Grid(){
                    Divider()
                    GridRow {
                        ForEach($habitList[0]) { $habit in
                            if habit.empty {
                                NavigationLink(destination:  AnyView(AddView(habit: $habit))) {
                                    EmptyView()
                                        .offset(y:-5)
                                        .offset(x:10)
                                }
                            } else {
                                    ButtonView(habit: $habit)
                                    .offset(y:-65)
                                    .offset(x:-65)
                            }
                        }
                    }
                    Divider()
                    GridRow {
                        ForEach($habitList[1]) { $habit in
                            if habit.empty {
                                NavigationLink(destination:  AnyView(AddView(habit: $habit))) {
                                    EmptyView()
                                        .offset(y:-5)
                                        .offset(x:10)
                                }
                            } else {
                                    ButtonView(habit: $habit)
                                    .offset(y:-65)
                                    .offset(x:-65)
                            }
                        }
                    }
                    Divider()
                    GridRow {
                        ForEach($habitList[2]) { $habit in
                            if habit.empty {
                                NavigationLink(destination:  AnyView(AddView(habit: $habit))) {
                                    EmptyView()
                                        .offset(y:-5)
                                        .offset(x:10)
                                }
                            } else {
                                ButtonView(habit: $habit)
                                    .offset(y:-65)
                                    .offset(x:-65)
                            }
                        }
                    }
                    Divider()
                }.background(CustomColor.homeSoil)
                 .padding(80)
                 .rotationEffect(Angle(degrees: 45), anchor: .center) //I found this online :)
                 .scaleEffect(x: 1.0, y: 0.65, anchor: .center)
                //  the frame is an attempt to make the rectangle a proper square instead of a rectangle. it didn't work.
//                 .frame(width: screenSize.width/4.5, height: screenSize.width/1.2, alignment: .top)
                Text("One day, or day one? You decide.")
                            .position(x:200,y:100).foregroundColor(.teal).font(.system(size: 20)
                                .bold())
                
                Spacer()
                HStack(spacing: 60.0){
                    Button("Reset Garden", role: .destructive) {
                        isPresentingConfirm = true
                    }
                    .confirmationDialog("Are you sure?",
                      isPresented: $isPresentingConfirm) {
                      Button("Delete this plant?", role: .destructive) {
                          habitList =
                             [[Habit(), Habit(), Habit()],
                              [Habit(), Habit(), Habit()],
                              [Habit(), Habit(), Habit()]]
                        }
                    }
                }
                
            }
            .background(Color("ColorHomeBackground"))
            .navigationTitle("Your Garden")
        } // end of navigation view
        .onChange(of: scenePhase) {phase in
            if phase == .inactive {saveAction()}
        }
    } // end of body
}

struct CustomColor {
    static let homeGreen = Color("ColorHomeBackground")
    static let homeSoil = Color("ColorSoil")
}

// found the following function from this site: https://iostutorialjunction.com/2019/09/get-number-of-days-between-two-dates-swift.html
func daysBetween(start: Date, end: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: start, to: end).day!
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(habitList: .constant(Habit.sampleData), saveAction: {})
    }
}



