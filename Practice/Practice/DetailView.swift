//
//  DetailView.swift
//  Practice
//
//  Created by Minh Nguyen on 2/20/23.
//

import SwiftUI

struct DetailView: View {
    let habit : Habit
    let PLANTICONSIZE = 100.0
    
    var body: some View {
//        List{
//            Section(header: Text("Content Detail")){
//                HStack {
//                    Label("Name", systemImage: "clock")
//                    Spacer()
//                    Text(habit.name)
//                }
//            }
//        }
        
        //HARDCODED THE VALUES FOR FONT SIZE etc. gotta change
        VStack(){
            Text(habit.name).multilineTextAlignment(.center).font(.system(size: 75, weight: .light, design: .serif))
                
            habit.plant.resizable().frame(width: PLANTICONSIZE, height: PLANTICONSIZE)
            
            LinearProgressDemoView(habit: habit)
            List{
                Section(header: Text("Habit Details")){
                    HStack {
                        Label("Priority", systemImage: "exclamationmark.square")
                                Spacer()
                        Label("", systemImage: getImportanceLevel(num: habit.importance))
                                
                    }
                    HStack {
                        Label("Example", systemImage: "info.circle")
                                Spacer()
                        Text("filler stuff")
                                
                    }
                    HStack {
                        Label("Example", systemImage: "info.circle")
                                Spacer()
                        Text("filler stuff")
                                
                    }
                    HStack {
                        Label("Example", systemImage: "info.circle")
                                Spacer()
                        Text("filler stuff")
                                
                    }
                    HStack {
                        Label("Example", systemImage: "info.circle")
                                Spacer()
                        Text("filler stuff")
                                
                    }
                }
                
            }.listStyle(.plain)
        }
        
        
    }
}

func getImportanceLevel(num: Int)->String{
    if (num == 1){
        return "exclamationmark"
    }
    if (num == 2){
        return "exclamationmark.2"
    }
    return "exclamationmark.3"
}

struct DetailView_Previews: PreviewProvider {
    static var habit = Habit.sampleData[2]
    static var previews: some View {
        DetailView(habit: habit)
    }
}

struct LinearProgressDemoView: View {
    let habit: Habit

    var body: some View {
        VStack {
            Text("Health:").foregroundColor(Color.green)
            ProgressView(value: habit.health).padding(70).frame(height: 10)
                .accentColor(Color.green)
                .scaleEffect(x: 1, y: 3, anchor: .center)
        
        }
    }
}
