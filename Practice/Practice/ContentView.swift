//
//  ContentView.swift
//  Practice
//
//  Created by Matthew Mukai on 2/8/23.
// Michael and Curran and Francesca
//The main front screen/page. It displays the main grid of plants and other icons.

import SwiftUI
let MENUICONSIZE = 60.0


//the main Habit display 3x3 grid
struct ContentView: View {
    @Binding var habitList: [[Habit]]
    @GestureState var isLongPressed = false
    var body: some View {
        NavigationView {
            VStack{
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
                                        if ((daysBetween(start: habit.start, end: habit.end)) > 10 ) {
                                            ButtonView(habit: $habit)
                                                .offset(y:-65)
                                                .offset(x:-65)
                                        } else if ((daysBetween(start: habit.start, end: habit.end)) > 5) {
                                            ButtonView(habit: $habit)
                                                .offset(y:-65)
                                                .offset(x:-65)
                                        } else {
                                            ButtonView(habit: $habit)
                                                .offset(y:-65)
                                                .offset(x:-65)
                                        }
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
                    shopBtn
                }
                HStack(spacing: 60.0){
                }
                
            }
            .background(Color("ColorHomeBackground"))
            .navigationTitle("Garden")
            
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
        ContentView(habitList: .constant(Habit.sampleData))
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

    private var shopBtn: some View{
        Button("Shop") {
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
        }
    }

    private var plantBtn: some View{
        Button(action: {
            // What will initiate when the button is pressed
        }) {
            Image("tomatoPlant").resizable().frame(width: 28.0, height: 28.0)
            // What will the button look like
        }
    }
}

