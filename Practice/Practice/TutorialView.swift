////
////  ContentView.swift
////  Practice
////
////  Created by Matthew Mukai on 2/8/23.
//// Michael and Curran and Francesca
////The main front screen/page. It displays the main grid of plants and other icons.
//
//import SwiftUI
////let MENUICONSIZE = 60.0
//
//
////the main Habit display 3x3 grid
//struct TutorialView: View {
//    var text1 = "Click a shovel to plant!"
//    @Binding var habitList: [[Habit]]
//    @GestureState var isLongPressed = false
//    @Environment(\.scenePhase) private var scenePhase
//    var tut = true
//    let saveAction: () -> Void
//    var body: some View {
//        NavigationView {
//            VStack{
//                Grid(){
//                            Divider()
//                            GridRow {
//                                ForEach($habitList[0]) { $habit in
//                                    if habit.empty {
//                                        NavigationLink(destination:  AnyView(AddView(habit: $habit))) {
////                                            if tut{
////                                                Text(text1).foregroundColor(CustomColor.homeGreen)
////                                            }
//                                            EmptyView()
//                                                .offset(y:-5)
//                                                .offset(x:10)
//                                        }
//                                    } else {
//                                        if ((daysBetween(start: habit.start, end: habit.end)) > 10 ) {
//                                            ButtonView(habit: $habit)
//                                                .offset(y:-65)
//                                                .offset(x:-65)
//                                        } else if ((daysBetween(start: habit.start, end: habit.end)) > 5) {
//                                            ButtonView(habit: $habit)
//                                                .offset(y:-65)
//                                                .offset(x:-65)
//                                        } else {
//                                            ButtonView(habit: $habit)
//                                                .offset(y:-65)
//                                                .offset(x:-65)
//                                        }
//                                    }
//                                }
//                            }
//                            Divider()
//                            GridRow {
//                                ForEach($habitList[1]) { $habit in
//                                    if habit.empty {
//                                        NavigationLink(destination:  AnyView(AddView(habit: $habit))) {
//                                            EmptyView()
//                                                .offset(y:-5)
//                                                .offset(x:10)
//                                        }
//                                    } else {
//                                            ButtonView(habit: $habit)
//                                            .offset(y:-65)
//                                            .offset(x:-65)
//                                    }
//                                }
//                            }
//                            Divider()
//                            GridRow {
//                                ForEach($habitList[2]) { $habit in
//                                    if habit.empty {
//                                        NavigationLink(destination:  AnyView(AddView(habit: $habit))) {
//                                            EmptyView()
//                                                .offset(y:-5)
//                                                .offset(x:10)
//                                        }
//                                    } else {
//                                        ButtonView(habit: $habit)
//                                            .offset(y:-65)
//                                            .offset(x:-65)
//                                    }
//                                }
//                            }
//                            Divider()
//                }.background(CustomColor.homeSoil)
//                 .padding(80)
//                 .rotationEffect(Angle(degrees: 45), anchor: .center) //I found this online :)
//                 .scaleEffect(x: 1.0, y: 0.5, anchor: .center)
//                Text("One day, or day one? You decide.")
//                            .position(x:200,y:100).foregroundColor(.teal).font(.system(size: 20)
//                                .bold())
//                Spacer()
//                if tut{
//                    Text(text1)
//                            .position(x:200,y:100)
//                            .foregroundColor(.black)
//                            .font(.system(size: 20).bold())
////                        .foregroundColor(.black).font(.system(size: 20)
////                                    .bold())
//
//
//
//                    Spacer()
//                }
////                if tut{
////                    remove(at: 200, 100)
////                }
////                ControlGroup {
////                    homeBtn
////                    calendarBtn
////                    shopBtn
////                }
//                HStack(spacing: 60.0){
//                }
//
//            }
//            .background(Color("ColorHomeBackground"))
//        }
//        .onChange(of: scenePhase) {phase in
//            if phase == .inactive {saveAction()}
//        }
//    }
//}
//
////struct CustomColor {
////    static let homeGreen = Color("ColorHomeBackground")
////    static let homeSoil = Color("ColorSoil")
////}
//
//// found the following function from this site: https://iostutorialjunction.com/2019/09/get-number-of-days-between-two-dates-swift.html
////func daysBetween(start: Date, end: Date) -> Int {
////        return Calendar.current.dateComponents([.day], from: start, to: end).day!
////    }
//
//struct TutorialView_Previews: PreviewProvider {
//    static var previews: some View {
//        TutorialView(habitList: .constant(Habit.sampleData), saveAction: {})
//    }
//}
//
////Some bottom bar buttons that don't yet have functionality. TODO
//private extension TutorialView{
//    private var homeBtn: some View{
//        Button("Home") {
//            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//        }
//    }
//
//    private var calendarBtn: some View{
//        Button("Calendar") {
//            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//        }
//    }
//
//    private var shopBtn: some View{
//        Button("Shop") {
//            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//        }
//    }
//
//    private var plantBtn: some View{
//        Button(action: {
//            // What will initiate when the button is pressed
//        }) {
//            Image("tomatoPlant").resizable().frame(width: 28.0, height: 28.0)
//            // What will the button look like
//        }
//    }
//}
//
//