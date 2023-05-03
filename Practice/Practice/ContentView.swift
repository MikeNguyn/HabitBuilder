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
                ZStack{
                Circle()
                    .fill(Color("sunColor"))
                    .frame(width: screenSize.width/6.0, height: screenSize.width/6.0)
                    .shadow(color: Color("sunColor"), radius: 20)
                    .shadow(color: Color("sunColor"), radius: 10)
                    .position(x: screenSize.width*0.8, y: screenSize.height*0.1)
                //Cloud images
                Image("cloudOne")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color("cloudColor"))
                    .frame(width: screenSize.width/2.2, height: screenSize.width/3.7)
                    .rotation3DEffect(.degrees(0), axis: (x: 5.0, y: 5.0, z: 45.0))
                    .position(x: screenSize.width*0.2,  y: screenSize.height*0.15)
                Image("cloud2")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color("cloudColor"))
                    .frame(width: screenSize.width/2.2, height: screenSize.width/3.7)
                    .rotation3DEffect(.degrees(0), axis: (x: 5.0, y: 5.0, z: 45.0))
                    .position(x: screenSize.width*0.8,  y: screenSize.height*0.15)
            }

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

                //This is the start of our 3x3 Grid
                Grid(){
                    Divider()
                    GridRow {
                        ForEach($habitList[0]) { $habit in
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
                
                //This is the random quote portion
                Text(randomQuote())
                    .position(x:screenSize.width*0.5,y:0).foregroundColor(Color("quotesColor"))
                    .font(.system(size: 20)
                        .bold())
                
                Spacer()
                
                //Below is the button for the slideshow
                HStack{
                    NavigationLink(destination: ImageSlideShow(images: ["Tutss1", "Tutss1", "Tutss2", "Tutss3", "Tutss4","Tutss5", "Tutss6", "Tutss7", "Tutss8", "Tutss9", "Tutss10", "Tutss11", "Tutss12", "Tutss15", "Tutss16"])) {
                        Label("", systemImage: "questionmark.circle").padding(.leading, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.leading, 20)
                    .tint(Color("buttonColor"))
                    
                    Spacer()
                    
                    //Settings button
                    
                    NavigationLink(destination: SettingsView(habitList: $habitList)) {
                        Label("", systemImage: "gear").padding(.leading, 8)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.trailing, 20)
                    .tint(Color("buttonColor"))

                    
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



