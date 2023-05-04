//
//  AddView.swift
//  Practice
//
//  Created by Minh Nguyen on 2/25/23.
//
// The add view screen is a page for when a trowel is clicked. Allows users
// to enter info to create a new habit.

import SwiftUI

let screenSize: CGRect = UIScreen.main.bounds

//the fill in the information part of the habit.
struct AddView: View {
    @State private var showAlert = false
    @Binding var habit: Habit
    @State var name: String = ""
    @State var plant: Plant = Plant(plant: "tomato", stage: 3)
    @State var end: Date = Date()
    @State var frequency = [false, false, false, false, false, false, false]
    @State var importance = 1
    @State private var showingAlert = false
    var starterImages: [Image] = [Image("blueberryPlantSmall"),Image("orchidPlantSmall"),Image("tomatoPlantSmall"),Image("sunflowerPlantSmall"),Image("cornPlantSmall"),Image("peaPlantSmall"), Image("eggplantSmall")]
    var body: some View {
        NavigationView{
            List{
                HStack{
                    Text("Habit name")
                    Spacer()
                    TextField("Habit", text: $name).multilineTextAlignment(.trailing)
                        .tint(Color("accentColor"))
                        .onAppear{
                            UITextField.appearance().clearButtonMode = .whileEditing
                        }
                }
                HStack {
                    Text("Plant")
                    Spacer()
                    Menu{
                        Picker("Select Plant", selection: $habit.plant) {
                            ForEach(plantCasesforPicker3) { plant in
                                plant.image.tag(plant)
                            }
                        }
                    } label: {
                        habit.plant.image.resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
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
                    .tint(Color("accentColor"))
                    
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
                            .tint(Color("accentColor"))
                        HStack(alignment: .center){
                            Toggle("Thu", isOn: $frequency[4])
                            Toggle("Fri", isOn: $frequency[5])
                            Toggle("Sat", isOn: $frequency[6])
                        }.toggleStyle(.button)
                            .tint(Color("accentColor"))
                    }
                    Spacer()
                }.frame(alignment: .center)
                HStack{
                    Picker("Importance", selection: $importance) {
                        Label("Low", systemImage: "exclamationmark")
                            .foregroundStyle(.yellow, .black)
                            .tag(1)
                        Label("Medium", systemImage: "exclamationmark.2")
                            .foregroundStyle(.orange, .black)
                            .tag(2)
                        Label("High", systemImage: "exclamationmark.3")
                            .foregroundStyle(.red, .black)
                            .tag(3)
                    }
                }
            }
        }.navigationTitle("New Habit")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: DetailView(habit: $habit)){
                        Button("Done", action: { //WHEN DONE WAS CLICKED. SAVE THE INFORMATION and do calculations of habit age.
                            var start = Date()
                            var startDOW = start.dayNumberOfWeek()
                            var endDOW = end.dayNumberOfWeek()
                            var adjStart = start.shiftDate(shift: 8 - startDOW!)
                            var adjEnd = end.shiftDate(shift: -(endDOW! - 1))
                            var weeks = Double((Calendar.current.dateComponents([.day], from: adjStart!, to: adjEnd!).day! + 1)/7)
                            print(weeks)
                            var weeksCorrected = weeks.rounded(.toNearestOrAwayFromZero)
                            var age = 0
                            for i in (startDOW! ... 7) {
                                if frequency[i - 1] == true {
                                    age = age + 1
                                }
                            }
                            for i in (1 ... endDOW!) {
                                if frequency[i - 1] == true {
                                    age = age + 1
                                }
                            }
                            let count = frequency.filter{$0 == true}.count
                            age = age + Int(weeksCorrected) * count
                            print(age)
                            if (name != "" && frequency != [false, false, false, false, false, false, false] && age > 0) {
                                habit.name = name
                                habit.plant.stage = 1
                                habit.end = end
                                habit.frequency = frequency
                                habit.empty = false
                                habit.health = 1
                                habit.start = Date.now
                                habit.importance = importance
                                habit.age = age
                                habit.log = []
                                
                                //THIS BELOW IS FOR NOTIFICATIONS
                                checkForPermission(habitName: habit.name, daysOfWeek: habit.frequency)
                            } else {
                                print(showAlert)
                                showAlert.toggle()
                            }
                        })
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Habit not valid"),
                                message: name == "" ? Text("No name for habit") : frequency == [false, false, false, false, false, false, false] ? Text("No day chosen for check in") : Text("Period too short for any check in. Change frequency or end date")
                                )
                        }
                    }
                }
            }
    }
}

struct AddView_Previews: PreviewProvider {
    
    static var previews: some View {
        AddView(habit: .constant(Habit.sampleData[0][1]))
    }
}

//Used bottom article to help me with the check for permission and dispatch notification methods.
//https://stackoverflow.com/questions/61371631/how-to-set-uncalendarnotificationtrigger-for-workweek-monday-to-friday-in-swif

//This method checks current state of notifications and will dispatch a notification if authorized.
func checkForPermission(habitName: String, daysOfWeek: [Bool]){
    let notificationCenter = UNUserNotificationCenter.current()
    notificationCenter.getNotificationSettings{ settings in
        switch settings.authorizationStatus{ //tells us current state if notifications are allowed or not.
        case .authorized:
            dispatchNotification(habitName: habitName, daysOfWeek: daysOfWeek)
        case .denied:
            return
        case .notDetermined://or wasn't asked yet
            notificationCenter.requestAuthorization(options: [.alert, .sound]){
                didAllow, error in
                if didAllow{
                    dispatchNotification(habitName: habitName, daysOfWeek: daysOfWeek)
                }
            }
        default:
            return
        }
        
        
    }
}


//This function dispatches notifications for a specific habitName and for certain days of the week given in a [Bool]
//For testing purposes the hour and minute for each notification is hard coded. Can adjust to whatever.
func dispatchNotification(habitName: String, daysOfWeek: [Bool]){
    let identifier = habitName
    let title = "Time to water your plant!"
    let body = "Make sure to check in on your " + habitName + " habit!"
    let hour = 15 //int in military
    let minute = 7
    
    
    var notiDays: [Int] = []
    for i in 1...daysOfWeek.count{
        if (daysOfWeek[i-1]){
            notiDays.append(i)
        }
    }
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = .default
    
    let calendar = Calendar.current
    
    for day in notiDays {
        var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.weekday = day

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request) { (error) in
            if let error = error {
            }
        }
    }
}
