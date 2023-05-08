//
//  DetailView.swift
//  Practice
//
//  Created by Minh Nguyen on 2/20/23.
//
// Detail page for when an existing habit is clicked on.

import SwiftUI

//The main detail backbones that display a plants information.
struct DetailView: View {
    @Binding var habit: Habit
    let PLANTICONSIZE = 75.0
    @State var presentSheet = false
    @State private var isPresentingConfirm: Bool = false
    @State var day = Date()
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        var calendarClicked: Bool = false
        NavigationView{
            VStack(){
                habit.plant.image.resizable().frame(width: PLANTICONSIZE, height: PLANTICONSIZE)
                LinearProgressDemoView(habit: habit)
                Spacer()
                //Users can also check off habit on this page.
                Button("Check off Habit") {
                    let now = Date() // get the current date and time
                    let calendar = Calendar.current // get the current calendar
                    let todayDate = calendar.dateComponents([.year, .month, .day], from: now) // create a DateComponents object with just the year, month, and day
                    if (habit.frequency[now.dayNumberOfWeek()! - 1]) {
                        if (!habit.log.contains(todayDate)) {
                            print("the user checked off habit")
                            habit.log.insert(todayDate)
                            habit.plant = Plant(plant: habit.plant.plant, stage: checkPlantGrowth(age: habit.age, log: habit.log.count))
                            print(habit.plant.stage)
                        } else {
                            habit.log.remove(todayDate)
                            habit.plant = Plant(plant:        habit.plant.plant, stage: checkPlantGrowth(age: habit.age, log: habit.log.count))
                            print(habit.plant.stage)
                        }
                    }
                }
                //The displayed properties of a habit,
                List{
                    Section(header: Text("Habit Details")){
                        HStack {
                            Label("Priority", systemImage: "exclamationmark.square")
                            Spacer()
                            Label("", systemImage: getImportanceLevel(num: habit.importance))
                                .foregroundStyle(habit.importance == 1 ? .yellow: habit.importance == 2 ? .orange: .red, .black)
                        }
                        HStack {
                            Label("Checkins needed for complete growth", systemImage: "timer")
                            Spacer()
                            Text(String(habit.age) + " checkins")
                        }
                        HStack {
                            Label("Checkins in log", systemImage: "info.circle")
                            Spacer()
                            Text(String(habit.log.count) + " total checkins")
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
                        HStack
                        {
                            Label("End Date", systemImage:  "info.circle")
                            Spacer()
                            Text(stringOfDate(date:habit.end))
                        }
                        ZStack{
                            MultiDatePicker(                                     "Start Date",
                                selection: $habit.log
                            ).disabled(true)
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: screenSize.width*1.1, height: screenSize.height*0.35)
                                .position(x:screenSize.width/2,y:screenSize.height * 0.24)
                                .onTapGesture{
                                    calendarClicked = true
                                }
                        }
                    }
                }.background(CustomColor.homeGreen)
                    .tint(Color("accentColor"))
                    .listStyle(.plain)
                                        .datePickerStyle(.graphical)
                    .scaleEffect(x: 0.9, y: 0.9)
                
                
                //button that lets us delete a habit
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
                              Button("Delete this plant", role: .destructive) {
                                  habit = Habit()
                                  let notificationCenter = UNUserNotificationCenter.current()
                                  //removes future notifications for this habit
                                  notificationCenter.removePendingNotificationRequests(withIdentifiers: [habit.name])
                                }
                            }
                    
                        
                    
                    //button that allows us to edit habit
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
    if (health >= 0.67){
        return Color.green
    } else if (health >= 0.33) {
        return Color.yellow
    }
    return Color.red
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(habit: .constant(Habit.sampleData[0][1]))
    }
}

//Creates the progess bar of the plant.
struct LinearProgressDemoView: View {
    let habit: Habit

    var body: some View {
        VStack {
            Text("Progress:")
            ProgressView(value: Double(habit.log.count)/Double(habit.age)).padding(70).frame(height: 10)
                .accentColor(evaluateHealth(health: Double(habit.log.count)/Double(habit.age)))
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


func stringOfDate(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
    return dateFormatter.string(from: date)
}

