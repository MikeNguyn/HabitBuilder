//
//  AddView.swift
//  Practice
//
//  Created by Minh Nguyen on 2/25/23.
//

import SwiftUI
let listOfPlantImages = [Image("bananaemoji"),Image("roseemoji"),Image("tomatoemoji"),Image("cactusemoji")]
//let sizeOfPlantList: Int = listOfPlantImages.count
//let screenSize: CGRect = UIScreen.main.bounds

struct AddView: View {
    @State var tempName: String = ""
    @State var date: Date = Date()
    @State var selectedPlant = listOfPlantImages[0]
    var plantImagePicker =  PlantImageView()
    var body: some View {
        List{
            HStack{
                Text("Habit name")
                Spacer()
                TextField("Habit", text: $tempName)
            }
//            ScrollView(.horizontal) {
//                            HStack(spacing: 10) {
//                                ForEach(0..< listOfPlantImages.count) { imageIdx in
//                                           listOfPlantImages[imageIdx]
//                                           .resizable()
//                                           .frame(width: screenSize.width, height: screenSize.height * 0.85)
//                                           .aspectRatio(contentMode: .fit)
//                                        }
//                            }.padding()
//                        }.frame(height: 100)
            Picker(selection: $selectedPlant, label: Text("Select Plant")) {
                /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
                /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
            }
            

            HStack {
                Text("Tree")
            }
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
