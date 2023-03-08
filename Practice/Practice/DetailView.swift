//
//  DetailView.swift
//  Practice
//
//  Created by Minh Nguyen on 2/20/23.
//
// Detail page for when an existing habit is clicked on.

import SwiftUI

//The main detail backbones that display a plants information
struct DetailView: View {
    let habit : Habit
    let PLANTICONSIZE = 75.0
    
    
    var body: some View {
        NavigationView{
            VStack(){
                habit.plant.image.resizable().frame(width: PLANTICONSIZE, height: PLANTICONSIZE)
                LinearProgressDemoView(habit: habit)
                List{
                    Section(header: Text("Habit Details")){
                        HStack {
                            Label("Priority", systemImage: "exclamationmark.square")
                            Spacer()
                            Label("", systemImage: getImportanceLevel(num: habit.importance))
                            
                        }
                        HStack {
                            Label("Length", systemImage: "timer")
                            Spacer()
                            Text(String(habit.importance) + " days")
                            
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
                }
            }
        }.navigationTitle(habit.name)
    }
}

//function that takes in the importance/priority of the habit and returns !,!!,!!!
func getImportanceLevel(num: Int)->String{
    if (num == 1){
        return "exclamationmark"
    }
    if (num == 2){
        return "exclamationmark.2"
    }
    return "exclamationmark.3"
}

//Takes in a double for the health and returns green if >=0.5 and red if <0.5 for health bar
func evaluateHealth(health: Double)->Color{
    if (health >= 0.5){
        return Color.green
    }
    return Color.red
}

struct DetailView_Previews: PreviewProvider {
    static var habit = Habit.sampleData[2][1]
    static var previews: some View {
        DetailView(habit: habit)
    }
}

//Creates the health bar of the plant
struct LinearProgressDemoView: View {
    let habit: Habit

    var body: some View {
        VStack {
            Text("Health:").foregroundColor(evaluateHealth(health: habit.health))
            ProgressView(value: habit.health).padding(70).frame(height: 10)
                .accentColor(evaluateHealth(health: habit.health))
                .scaleEffect(x: 1, y: 3, anchor: .center)
        
        }
    }
}
