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
    @Binding var habit: Habit
    let PLANTICONSIZE = 75.0
    @State var presentSheet = false
    @State private var isPresentingConfirm: Bool = false
    
    
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
//                            Text(String(calculateLength(startDate: habit.start,endDate: habit.end)) + " days")
                            Text(String(habit.age) + " checkins")
                        }
                        HStack {
                            Label("Z calculation", systemImage: "timer")
                            Spacer()
                            var totalCheckins = calculateZ(frequency: habit.frequency, lengthOfHabit: calculateLength(startDate: habit.start,endDate: habit.end))
                            Text(String(totalCheckins) + " total checkins")
                            
                        }
                        //for date formatting
                        HStack {
                            Label("Started Habit On", systemImage: "info.circle")
                            Spacer()
                            Text(stringOfDate(date:habit.start))
                            
                        }
                        HStack {
                            Label("Frequency", systemImage: "info.circle")
                            Spacer()
                            Text(getWeekdaysNames(weekDaysBools:habit.frequency))
                            
                        }
                        
                    }
                }.background(CustomColor.homeGreen)
                    .listStyle(.plain)
                
                MultiDatePicker(                                     "Start Date",
                    selection: $habit.log
                )
                                        .datePickerStyle(.graphical)
                    .scaleEffect(x: 0.9, y: 0.9)
                
                HStack(spacing: 75){
                    Button("Delete habit", role: .destructive){
                        isPresentingConfirm = true
                    }.padding()
                        .cornerRadius(4.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4).stroke(Color(.systemRed), lineWidth: 2)
                        )
                            .confirmationDialog("Are you sure?",
                              isPresented: $isPresentingConfirm) {
                              Button("Delete this plant?", role: .destructive) {
                                  habit = Habit()
                                }
                            }
                    
                        
                    
                    
                    Button("Edit Habit") {
                                    presentSheet.toggle()
                                }
                                    /// Present a sheet once `shouldPresentSheet` becomes `true`.
                                    .sheet(isPresented: $presentSheet) {
                                        print("Sheet dismissed!")
                                    } content: {
                                        EditView(habit: $habit)
                                    }
                                    .background(CustomColor.homeGreen)
                                    .padding()
                                        .cornerRadius(4.0)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 4).stroke(Color(.systemBlue), lineWidth: 2)
                                        )
                }
                
                
            }//end of vstack
            .background(CustomColor.homeGreen)
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

//function that takes in the weekday frequency of the habit and returns the string of MTWThFSaSu
func getWeekdaysNames(weekDaysBools: [Bool])->String{
    var weekdayNames = ""
    let weekdays = ["Su","M","T","W","Th","F","Sa"]
    for i in 0...6{
        if weekDaysBools[i] {
            weekdayNames += weekdays[i] + " "
        }
    }
    return weekdayNames
}

//Takes in a double for the health and returns green if >=0.5 and red if <0.5 for health bar
func evaluateHealth(health: Double)->Color{
    if (health >= 0.5){
        return Color.green
    }
    return Color.red
}

struct DetailView_Previews: PreviewProvider {
//    static var habit = Habit.sampleData[2][1]
    static var previews: some View {
        DetailView(habit: .constant(Habit.sampleData[0][1]))
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

//from https://stackoverflow.com/questions/40075850/swift-3-find-number-of-calendar-days-between-two-dates
func calculateLength(startDate: Date,endDate: Date)->Int{
    let diffInDays = Calendar.current.dateComponents([.day], from: startDate, to: endDate).day
    
    let answer = diffInDays!
    return answer
}

//Z is the number of checkins to reach final goal image.
func calculateZ(frequency: [Bool], lengthOfHabit: Int)->Int{
    var freqInt = 0
    for i in frequency{ //for how many true days in the week
        if i{
            freqInt += 1
        }
    }
    var z = 0
    let numberofweeks = lengthOfHabit / 7
    z = freqInt  * numberofweeks
    return z
    
}

func stringOfDate(date: Date) -> String{
        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.dateStyle = .short
    return dateFormatter.string(from: date)
}

//struct DeleteButton: View {
//  @EnvironmentObject var store: Store
//  @State private var isPresentingConfirm: Bool = false
//
//  var body: some View {
//    Button("Delete", role: .destructive) {
//      isPresentingConfirm = true
//    }
//   .confirmationDialog("Are you sure?",
//     isPresented: $isPresentingConfirm) {
//     Button("Delete all items?", role: .destructive) {
//       store.deleteAll()
//      }
//    }
//  }
//}

