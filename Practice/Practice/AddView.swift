//
//  AddView.swift
//  Practice
//
//  Created by Minh Nguyen on 2/25/23.
//

import SwiftUI
let listOfPlant: [Habit.Plant] = [.cactus, .tomato, .banana, .rose]
//let sizeOfPlantList: Int = listOfPlantImages.count
let screenSize: CGRect = UIScreen.main.bounds

struct AddView: View {
    @State var tempName: String = ""
    @State var date: Date = Date()
    @State var selectedPlant = listOfPlant[0]
    var plantImagePicker =  PlantImageView()
    var body: some View {
        List{
            HStack{
                Text("Habit name")
                Spacer()
                TextField("Habit", text: $tempName)
            }
            Menu{
                Picker("Select Plant", selection: .constant(listOfPlant)) {
                    ForEach(listOfPlant) { plant in
                        plant.image
                            .resizable()
                            .frame(width: screenSize.width/15, height: screenSize.width/15)
                    }
                }
            } label: {
                Image("roseemoji").resizable()
                    .frame(width: screenSize.width/15, height: screenSize.width/15)
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
                        "Starting Date",
                        selection: $date,
                        displayedComponents: [.date])
                    .datePickerStyle(.wheel)
                }
                
            }
        }
    }

struct AddView_Previews: PreviewProvider {
    
    static var previews: some View {
        AddView()
    }
}
