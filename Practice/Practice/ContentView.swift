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
//                NavigationLink("Tutorial"){
//                    ImageSlideShow(images: ["Tutss1", "Tutss1", "Tutss2", "Tutss3", "Tutss4","Tutss5", "Tutss6", "Tutss7", "Tutss8", "Tutss9", "Tutss10", "Tutss11", "Tutss12", "Tutss15", "Tutss16"])
//                }
//                Button("Request Permission") {
//                    // requests permission from the user to send notifications. Click this first
//                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
//                        if success {
//                            print("All set!")
//                        } else if let error = error {
//                            print(error.localizedDescription)
//                        }
//                    }
//                }
                //Schedule button HAS BEEN MOVED TO ADDVIEW
                Grid(){
                    Divider()
                    GridRow {
                        ForEach($habitList[0]) { $habit in
                            if habit.empty {
                                NavigationLink(destination:  AnyView(AddView(habit: $habit))) {
                                    EmptyView()
                                        .offset(y:-5)
                                        .offset(x:-5)
//                                        .offset(x:10)
                                }
                            } else {
                                    ButtonView(habit: $habit)
                                    .offset(y:-30)
                                    .offset(x:-30)
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
                                        .offset(x:-5)
                                }
                            } else {
                                    ButtonView(habit: $habit)
                                    .offset(y:-30)
                                    .offset(x:-30)
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
                                        .offset(x:-5)
                                }
                            } else {
                                ButtonView(habit: $habit)
                                    .offset(y:-30)
                                    .offset(x:-30)
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
                            .position(x:200,y:0).foregroundColor(.black).font(.system(size: 20)
                                .bold())
                
                Spacer()
                HStack{
                    NavigationLink(destination: ImageSlideShow(images: ["Tutss1", "Tutss1", "Tutss2", "Tutss3", "Tutss4","Tutss5", "Tutss6", "Tutss7", "Tutss8", "Tutss9", "Tutss10", "Tutss11", "Tutss12", "Tutss15", "Tutss16"])) {
//                        Text(systemImage: "gear")
                        Label("", systemImage: "questionmark.circle")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.leading, 20)
                    
                    Spacer()
                    
                    NavigationLink(destination: SettingsView(habitList: $habitList)) {
//                        Text(systemImage: "gear")
                        Label("", systemImage: "gear")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.trailing, 20)
                    
                    
                    //Below i will save to show in a settings page
                    
                }.edgesIgnoringSafeArea(.all)
                
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(habitList: .constant(Habit.sampleData), saveAction: {})
    }
}



