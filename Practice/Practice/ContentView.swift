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
    @GestureState var isLongPressed = false
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: () -> Void
    var body: some View {
        NavigationView {
            VStack{
                Button("Request Permission") {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("All set!")
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                }
                
                Button("Schedule Notification") {
                    let content = UNMutableNotificationContent()
                    content.title = "Feed the cat"
                    content.subtitle = "It looks hungry"
                    content.sound = UNNotificationSound.default
                    
                    // show this notification five seconds from now
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    
                    //choose a random identifier
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    
                    // add our notification request
                    UNUserNotificationCenter.current().add(request)
                }
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
                 .scaleEffect(x: 1.0, y: 0.5, anchor: .center)
                Text("One day, or day one? You decide.")
                            .position(x:200,y:100).foregroundColor(.teal).font(.system(size: 20)
                                .bold())
                Spacer()
                ControlGroup {
                    homeBtn
                    calendarBtn
                    resetGarden
                }
                HStack(spacing: 60.0){
                }
                
            }
            .background(Color("ColorHomeBackground"))
        }
        .onChange(of: scenePhase) {phase in
            if phase == .inactive {saveAction()}
        }
    }
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

//Some bottom bar buttons that don't yet have functionality. TODO
private extension ContentView{
    private var homeBtn: some View{
        Button("Home") {
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
        }
    }

    private var calendarBtn: some View{
        Button("Calendar") {
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
        }
    }

    private var resetGarden: some View{
        Button("Reset Garden") {
            habitList =
               [[Habit(), Habit(), Habit()],
                [Habit(), Habit(), Habit()],
                [Habit(), Habit(), Habit()]]
        }
       .confirmationDialog( //this isn't quite working rn. Dialog isn't showing up.
           "Are you sure?",
           isPresented: $confirmationShow,
           titleVisibility: .visible
       ) {
           Button("YES", role: .destructive) {}
       }
    } // end of resetGarden

    private var plantBtn: some View{
        Button(action: {
            // What will initiate when the button is pressed
        }) {
            Image("tomatoPlant").resizable().frame(width: 28.0, height: 28.0)
            // What will the button look like
        }
    }
}

