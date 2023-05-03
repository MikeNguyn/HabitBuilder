//
//  EditView.swift
//  Practice
//
//  Created by Matthew Mukai on 3/20/23.
//

import SwiftUI

//This edit view only lets us edit the habit name, image, and importance of the habit.

//the fill in the information part of the habit
struct EditView: View {
    @Binding var habit: Habit
    @Environment(\.dismiss) private var dismiss
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
                            ForEach(whichPickertoUse(stage: habit.plant.stage)) { plant in
                                plant.image
                                    .tag(plant)
                            }
                        }
                    } label: {
                        habit.plant.image.resizable()
                            .frame(width: screenSize.width/10, height: screenSize.width/10)
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                HStack{
                    Picker("Importance", selection: $habit.importance) {
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
        }
        .navigationTitle("Edit Habit")
    }
}

struct EditView_Previews: PreviewProvider {
    
    static var previews: some View {
        EditView(habit: .constant(Habit.sampleData[0][1]))
    }
}


func whichPickertoUse(stage: Int) -> [Plant]{
    var picker: [Plant] = plantCasesforPicker
    if (stage == 2){
        picker = plantCasesforPicker2
//        print("using second picker")
    }
    if (stage == 3){
        picker = plantCasesforPicker3
//        print("using third picker")
    }
    return picker
    
}
