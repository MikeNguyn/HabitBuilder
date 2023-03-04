//
//  AddView.swift
//  Practice
//
//  Created by Minh Nguyen on 2/25/23.
//

import SwiftUI

//let sizeOfPlantList: Int = listOfPlantImages.count
let screenSize: CGRect = UIScreen.main.bounds

struct AddView: View {
    @State var tempName: String = ""
    @State var date: Date = Date()
    @Binding var listOfPlant: [Habit.Plant]
    @State var chosenPlant = Habit.Plant.tomato
    @State var daysOfWeek = [false, false, false, false, false, false, false]
    var plantImagePicker =  PlantImageView()
    var body: some View {
        NavigationView{
            List{
                HStack{
                    Text("Habit name")
                    Spacer()
                    TextField("Habit", text: $tempName)
                }
                HStack {
                    Text("Plant")
                    Spacer()
                    Menu{
                        Picker("Select Plant", selection: $chosenPlant) {
                            ForEach(listOfPlant) { plant in
                                plant.image
                                    .tag(plant)
                            }
                        }
                    } label: {
                        chosenPlant.image.resizable()
                            .frame(width: screenSize.width/10, height: screenSize.width/10)
                    }
                }
    //                Text("Plant")
    //                Menu(content: {
    //                    Picker("Select Plant", selection: .constant(listOfPlant)) {
    //                    ForEach(listOfPlant) { plant in
    //                        plant.image
    //                            .resizable()
    //                            .frame(width: screenSize.width/15, height: screenSize.width/15)
    //                    }
    //                    }, label: {
    //                        Text("Plant")
    //                    }
                
                HStack{
                    DatePicker(
                        "End date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                }
                HStack {
                    Spacer()
                    VStack(alignment: .center){
                        Text("Days of week")
                        HStack(alignment: .center){
                            Toggle("Sun", isOn: $daysOfWeek[0])
                            Toggle("Mon", isOn: $daysOfWeek[1])
                            Toggle("Tue", isOn: $daysOfWeek[2])
                            Toggle("Wed", isOn: $daysOfWeek[3])
                        }.toggleStyle(.button)
                        HStack(alignment: .center){
                            Toggle("Thu", isOn: $daysOfWeek[4])
                            Toggle("Fri", isOn: $daysOfWeek[5])
                            Toggle("Sat", isOn: $daysOfWeek[6])
                        }.toggleStyle(.button)
                    }
                    Spacer()
                }.frame(alignment: .center)
            }
        }.navigationTitle("New Habit")
    }
}

struct AddView_Previews: PreviewProvider {
    
    static var previews: some View {
        AddView(listOfPlant: .constant([.tomato, .cactus,.banana,.rose]))
    }
}
