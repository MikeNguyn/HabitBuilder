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
                                        }
                                    } else {
                                        NavigationLink(destination:  AnyView(DetailView(habit: $habit))) {
                                            ButtonView(habit: habit)
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
                                        }
                                    } else {
                                        NavigationLink(destination:  AnyView(DetailView(habit: $habit))) {
                                            ButtonView(habit: habit)
                                        }
                                    }
                                }
                            }
                            Divider()
                            GridRow {
                                ForEach($habitList[2]) { $habit in
                                    if habit.empty {
                                        NavigationLink(destination:  AnyView(AddView(habit: $habit))) {
                                            EmptyView()
                                        }
                                    } else {
                                        NavigationLink(destination:  AnyView(DetailView(habit: $habit))) {
                                            ButtonView(habit: habit)
                                        }
                                    }
                                }
                            }
                            Divider()
                }.background(Color.brown)
                 .padding(80)
                 .rotationEffect(Angle(degrees: 45), anchor: .center) //I found this online :)
                 .scaleEffect(x: 1.0, y: 0.5, anchor: .center)
                Spacer()
                ControlGroup {
                    homeBtn
                    calendarBtn
                    shopBtn
                }
                HStack(spacing: 60.0){
                }
                
            }
            
            .navigationTitle("Garden")
        }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(habitList: .constant(Habit.sampleData))
    }
}

struct ExtrudeModifier<Texture: View> : ViewModifier {
    var depth: CGFloat
    var texture: Texture
    
    func body( content: Content) -> some View {
        content
            //Front Left Side
            .overlay(
                GeometryReader {geo in
                    // Step 2
                    texture
                        .brightness(-0.05)
                        // Step 3
                        .scaleEffect(x: 1, y: geo.size.height * geo.size.height, anchor: .bottom)
                        // Step 4
                        .frame(height: depth, alignment: .top)
                        .mask(Rectangle())
                        .rotation3DEffect(Angle(degrees: 180), axis: (x: 1.0, y: 0.0, z: 0.0),
                                          anchor: .center,
                                          anchorZ: 0.0,
                                          perspective: 1.0
                        )
                        // Step 5
                        .projectionEffect(ProjectionTransform(CGAffineTransform(a: 1, b: 0, c: 1, d: 1, tx:  0, ty: 0)))
                        .offset(x: 0, y: geo.size.height)
                }
                , alignment: .center)
        
            //Front Right Side
            .overlay(
                GeometryReader { geo in
                    texture
                        .brightness(-0.1)
                        .scaleEffect(x: geo.size.width * geo.size.width, y: 1.0, anchor: .trailing)
                        .frame(width: depth, alignment: .leading)
                        .clipped()
                        .rotation3DEffect(
                            Angle(degrees: 180),
                            axis: (x: 0.0, y: 1.0, z: 0.0),
                            anchor: .leading,
                            anchorZ: 0.0,
                            perspective: 1.0
                        )
                        .projectionEffect(ProjectionTransform(CGAffineTransform(a: 1, b: 1, c: 0, d: 1, tx: 0, ty: 0)))
                        .offset(x: geo.size.width + depth, y: 0 + depth)
                }
                , alignment: .center)
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
