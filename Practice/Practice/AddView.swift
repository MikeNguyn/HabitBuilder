//
//  AddView.swift
//  Practice
//
//  Created by Minh Nguyen on 2/25/23.
//
// The add view screen is a page for when a trowel is clicked. Allows users
// to enter info to create a new habit.

import SwiftUI

//let sizeOfPlantList: Int = listOfPlantImages.count
let screenSize: CGRect = UIScreen.main.bounds

//the fill in the information part of the habit
struct AddView: View {
    @Binding var habit: Habit
    @State var name: String = ""
    @State var plant: Plant = Plant(plant: "tomato", stage: 3)
    @State var end: Date = Date()
    @State var frequency = [false, false, false, false, false, false, false]
    @State var importance = 1
    var starterImages: [Image] = [Image("blueberryPlantSmall"),Image("orchidPlantSmall"),Image("tomatoPlantSmall"),Image("sunflowerPlantSmall"),Image("cornPlantSmall"),Image("peaPlantSmall") ]
//    @State var date: Date = Date()
//    @Binding var listOfPlant: [Habit.Plant]
//    @State var chosenPlant = Habit.Plant.tomato
//    @State var daysOfWeek = [false, false, false, false, false, false, false]
//    @State var importance = [1, 2, 3]
//    @State var chosenImportance: Int = 1
    var body: some View {
        NavigationView{
            List{
                HStack{
                    Text("Habit name")
                    Spacer()
                    TextField("Habit", text: $name).multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Plant")
                    Spacer()
                    Menu{
                        Picker("Select Plant", selection: $habit.plant) {
                            ForEach(plantCasesforPicker) { plant in
                                plant.image.tag(plant)
                            }
                        }
                    } label: {
                        plant.image.resizable()
                            .frame(width: screenSize.width/10, height: screenSize.width/10)
                    }
                }
                HStack{
                    DatePicker(
                        "End date",
                        selection: $end,
                        in: Date()...,
                        displayedComponents: [.date]
                        
                    )
                    
                }
                HStack {
                    Spacer()
                    VStack(alignment: .center){
                        Text("Days of week")
                        HStack(alignment: .center){
                            Toggle("Sun", isOn: $frequency[0])
                            Toggle("Mon", isOn: $frequency[1])
                            Toggle("Tue", isOn: $frequency[2])
                            Toggle("Wed", isOn: $frequency[3])
                        }.toggleStyle(.button)
                        HStack(alignment: .center){
                            Toggle("Thu", isOn: $frequency[4])
                            Toggle("Fri", isOn: $frequency[5])
                            Toggle("Sat", isOn: $frequency[6])
                        }.toggleStyle(.button)
                    }
                    Spacer()
                }.frame(alignment: .center)
                HStack{
                    Picker("Importance", selection: $importance) {
                        Label("", systemImage: "exclamationmark")
                            .foregroundStyle(.yellow, .black)
                            .tag(1)
                        Label("", systemImage: "exclamationmark.2")
                            .foregroundStyle(.orange, .black)
                            .tag(2)
                        Label("", systemImage: "exclamationmark.3")
                            .foregroundStyle(.red, .black)
                            .tag(3)
                    }
                }
            }
        }.navigationTitle("New Habit")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: DetailView(habit: $habit)){
                        Button("Done", action: {
//                            print(habit.plant.plant)
                            habit.name = name
//                            habit.plant = plant
                            habit.end = end
                            habit.frequency = frequency
                            habit.empty = false
                            habit.health = 1
                            habit.start = Date.now
                            habit.importance = importance
                            var startDOW = habit.start.dayNumberOfWeek()
                            var endDOW = habit.end.dayNumberOfWeek()
                            var adjStart = habit.start.shiftDate(shift: 8 - startDOW!)
                            var adjEnd = habit.end.shiftDate(shift: -(endDOW! - 1))
                            var weeks = Double((Calendar.current.dateComponents([.day], from: adjStart!, to: adjEnd!).day! + 1)/7)
                            var weeksCorrected = weeks.rounded(.toNearestOrAwayFromZero)
                            var age = 0
                            for i in (startDOW! ... 7) {
                                if habit.frequency[i - 1] == true {
                                    age = age + 1
                                }
                            }
                            for i in (1 ... endDOW!) {
                                if habit.frequency[i - 1] == true {
                                    age = age + 1
                                }
                            }
                            let count = frequency.filter{$0 == true}.count
                            age = age + Int(weeksCorrected) * count
                            habit.age = age
                            habit.log = []
                            ScheduleNotification(endDate: end)
                        })
                    }
                }
            }
    }
}

func ScheduleNotification (endDate: Date) {
    // creates the notification and schedules it to appear in 5 seconds. click this button second.
    let content = UNMutableNotificationContent()
    content.title = "Feed the cat"
    content.subtitle = "It looks hungry"
    content.sound = UNNotificationSound.default
    
    // show this notification five seconds from now
    //this needs to trigger on end date
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    
    //choose a random identifier
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    // add our notification request
    UNUserNotificationCenter.current().add(request)
    print("IT WORKED")
}

struct AddView_Previews: PreviewProvider {
    
    static var previews: some View {
        AddView(habit: .constant(Habit.sampleData[0][1]))
    }
}

