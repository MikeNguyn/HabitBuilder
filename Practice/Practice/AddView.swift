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
                    TextField("Habit", text: $habit.name).multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Plant")
                    Spacer()
                    Menu{
                        Picker("Select Plant", selection: $habit.plant) {
                            ForEach(Habit.Plant.allCases) { plant in
                                plant.image
                                    .tag(plant)
                            }
                        }
                    } label: {
                        habit.plant.image.resizable()
                            .frame(width: screenSize.width/10, height: screenSize.width/10)
                    }
                }
                HStack{
                    DatePicker(
                        "End date",
                        selection: $habit.end,
                        displayedComponents: [.date]
                    )
                }
                HStack {
                    Spacer()
                    VStack(alignment: .center){
                        Text("Days of week")
                        HStack(alignment: .center){
                            Toggle("Sun", isOn: $habit.frequency[0])
                            Toggle("Mon", isOn: $habit.frequency[1])
                            Toggle("Tue", isOn: $habit.frequency[2])
                            Toggle("Wed", isOn: $habit.frequency[3])
                        }.toggleStyle(.button)
                        HStack(alignment: .center){
                            Toggle("Thu", isOn: $habit.frequency[4])
                            Toggle("Fri", isOn: $habit.frequency[5])
                            Toggle("Sat", isOn: $habit.frequency[6])
                        }.toggleStyle(.button)
                    }
                    Spacer()
                }.frame(alignment: .center)
                HStack{
                    Picker("Importance", selection: $habit.importance) {
                        Label("", systemImage: "exclamationmark").tag(1)
                        Label("", systemImage: "exclamationmark.2").tag(2)
                        Label("", systemImage: "exclamationmark.3").tag(3)
                    }
                }
            }
        }.navigationTitle("New Habit")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: DetailView(habit: $habit)){
                        Button("Done", action: {
                            habit.empty = false
                            habit.health = 1
                        })
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

struct DatePickerExample: View {
    @State private var date = Date()
    var body: some View {
        DatePicker( "Pick a date", selection: $date, in: Date()..., displayedComponents: [.date]) .padding()
    }
    
}
