//
//  ContentView.swift
//  Practice
//
//  Created by Matthew Mukai on 2/8/23.
// Michael and Curran and Francesca

import SwiftUI
let PLANTICONSIZE = 100.0
let MENUICONSIZE = 60.0

struct ContentView: View {
    var body: some View {
        VStack{
            Grid(){
                        Divider()
                        GridRow {
                            Button(action: {
                                // What will initiate when the button is pressed
                            }) {
                                Image("tomatoemoji").resizable().frame(width: PLANTICONSIZE, height: PLANTICONSIZE)
                                // What will the button look like
                            }
                            Button(action: {
                                // What will initiate when the button is pressed
                            }) {
                                Image("bananaemoji").resizable().frame(width: PLANTICONSIZE, height: PLANTICONSIZE)
                                // What will the button look like
                            }
                            Button(action: {
                                // What will initiate when the button is pressed
                            }) {
                                Image("bananaemoji").resizable().frame(width: PLANTICONSIZE, height: PLANTICONSIZE)
                                // What will the button look like
                            }
                        }
                        Divider()
                        GridRow {
                            Button(action: {
                                // What will initiate when the button is pressed
                            }) {
                                Image("bananaemoji").resizable().frame(width: PLANTICONSIZE, height: PLANTICONSIZE)
                                // What will the button look like
                            }
                            Button(action: {
                                // What will initiate when the button is pressed
                            }) {
                                Image("tomatoemoji").resizable().frame(width: PLANTICONSIZE, height: PLANTICONSIZE)
                                // What will the button look like
                            }
                            Button(action: {
                                // What will initiate when the button is pressed
                            }) {
                                Image("roseemoji").resizable().frame(width: PLANTICONSIZE, height: PLANTICONSIZE)
                                // What will the button look like
                            }
                        }
                        Divider()
                        GridRow {
                            Button(action: {
                                // What will initiate when the button is pressed
                            }) {
                                Image("roseemoji").resizable().frame(width: PLANTICONSIZE, height: PLANTICONSIZE)
                                // What will the button look like
                            }
                            Button(action: {
                                // What will initiate when the button is pressed
                            }) {
                                Image("tomatoemoji").resizable().frame(width: PLANTICONSIZE, height: PLANTICONSIZE)
                                // What will the button look like
                            }
                            Button(action: {
                                // What will initiate when the button is pressed
                            }) {
                                Image("bananaemoji").resizable().frame(width: PLANTICONSIZE, height: PLANTICONSIZE)
                                // What will the button look like
                            }
                        }
                        Divider()
            }.padding(80.0)
//            ControlGroup {
//                homeBtn
//                calendarBtn
//                shopBtn
//
//            }
            HStack(spacing: 60.0){
                Button(action: {
                    // What will initiate when the button is pressed
                }) {
                    Image("homeIcon").resizable().frame(width: MENUICONSIZE, height: MENUICONSIZE)
                    // What will the button look like
                }
                Button(action: {
                    // What will initiate when the button is pressed
                }) {
                    Image("calendarIcon").resizable().frame(width: MENUICONSIZE, height: MENUICONSIZE)
                    // What will the button look like
                }
                Button(action: {
                    // What will initiate when the button is pressed
                }) {
                    Image("shopIcon").resizable().frame(width: MENUICONSIZE, height: MENUICONSIZE)
                    // What will the button look like
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
