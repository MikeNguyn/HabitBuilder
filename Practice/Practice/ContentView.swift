//
//  ContentView.swift
//  Practice
//
//  Created by Matthew Mukai on 2/8/23.
// Michael and Curran and Francesca
//The main front screen/page. It displays the main grid of plants and other icons.

import SwiftUI
let PLANTICONSIZE = 100.0
let MENUICONSIZE = 60.0


//the main Habit display 3x3 grid
struct ContentView: View {
    @Binding var habitList: [Habit]
    var body: some View {
        NavigationView {
            VStack{
                Grid(){
                            Divider()
                            GridRow {
                                ForEach($habitList[0...2]) { $habit in
                                    NavigationLink(destination: habit.name == "" ? AnyView(AddView(habit: $habit)) : AnyView(DetailView(habit: habit))) {
                                        ButtonView(habit: habit)
                                    }
                                }
                                
                            }
                            Divider()
                            GridRow {
                                ForEach($habitList[3...5]) { $habit in
                                    NavigationLink(destination: habit.name == "" ? AnyView(AddView(habit: $habit)) : AnyView(DetailView(habit: habit))) {
                                        ButtonView(habit: habit)
                                    }
                                }
                            }
                            Divider()
                            GridRow {
                                ForEach($habitList[6...8]) { $habit in
                                    NavigationLink(destination: habit.name == "" ? AnyView(AddView(habit: $habit)) : AnyView(DetailView(habit: habit))) {
                                        ButtonView(habit: habit)
                                    }
                                }
                            }
                            Divider()
                }.padding(80)
                Spacer()
                ControlGroup {
                    homeBtn
                    calendarBtn
                    shopBtn
                }
                
                HStack(spacing: 60.0){
//                    ButtonView(buttonImage: Image("homeIcon"))
//                    ButtonView(buttonImage: Image("calendarIcon"))
//                    ButtonView(buttonImage: Image("calendarIcon"))
                }
            }
            .navigationTitle("Garden")
        }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var habitManager = HabitManager()
    static var previews: some View {
        ContentView(habitList: .constant(habitManager.habits))
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
            Image("tomatoemoji").resizable().frame(width: 28.0, height: 28.0)
            // What will the button look like
        }
    }
}
