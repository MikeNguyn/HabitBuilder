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
    @State var plant: Habit.Plant = Habit.Plant.tomato
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
                        Picker("Select Plant", selection: $plant) {
                            ForEach(Habit.Plant.allCases) { plant in
                                plant.image
                                    .tag(plant)
                            }
                        }
                    } label: {
                        self.plant.image.resizable()
                            .frame(width: screenSize.width/10, height: screenSize.width/10)
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
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
                            habit.name = name
                            habit.plant = plant
                            habit.end = end
                            habit.frequency = frequency
                            habit.empty = false
                            habit.health = 1
                            habit.start = Date.now
                            habit.importance = importance
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

