//
//  ButtonView.swift
//  Practice
//
//  Created by Minh Nguyen on 2/20/23.
//
// A button view that allows a plant to become a button to be clicked on

import SwiftUI


struct ButtonView: View {
    @Binding var habit: Habit
    let screenSize: CGRect = UIScreen.main.bounds
    @GestureState var press = false
    @State var show = false
    @State var isShowingDetailView = false
    
    var body: some View {
        VStack{
            habit.plant.image
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .frame(width: screenSize.width/6, height: screenSize.width/6)
                // need to get width and height of original images, or resize all images to have the same w and h
                .scaleEffect(x: 1.5, y: 2.5, anchor: .center)
                .shadow(color: {
                    let now = Date()
                    let calendar = Calendar.current
                    if (habit.frequency[now.dayNumberOfWeek()! - 1]){
                        if (habit.log.contains(calendar.dateComponents([.year, .month, .day], from: now))) {
                            return Color.green
                        } else {
                            if habit.importance == 1{
                                return Color.yellow
                            } else if habit.importance == 2 {
                                return Color.orange
                            } else if habit.importance == 3 {
                                return Color.red
                            } else {
                                return Color.white.opacity(0.0)
                            }
                        }
                    }
                    else {
                        return Color.yellow.opacity(0.0)
                    }
                }(), radius: 5.0 )
                .scaleEffect(press ? 1.5: 1)
                .animation(.spring(response: 0.4, dampingFraction: 1))
                .highPriorityGesture(
                    //below is the long press gesture that will update the pressed state. it will make the plant glow and add to log.
                    LongPressGesture(minimumDuration: 0.5)
                        .updating($press) {currentState, gestureState, transaction in
                            gestureState = currentState
                        }
                        .onEnded{ value in
                            
//                            print(habit.log)
                            let now = Date() // get the current date and time
                            let calendar = Calendar.current // get the current calendar
                            let todayDate = calendar.dateComponents([.year, .month, .day], from: now) // create a DateComponents object with just the year, month, and day
                            if (habit.frequency[now.dayNumberOfWeek()! - 1]) {
                                if (!habit.log.contains(todayDate)) {
                                    print("the user checked off habit")
                                    habit.log.insert(todayDate)
                                    // May trigger plant growth if it is the right day.
                                    habit.plant = Plant(plant: habit.plant.plant, stage: checkPlantGrowth(age: habit.age, log: habit.log.count))
                                    print(habit.plant.stage)
                                } else {
                                    habit.log.remove(todayDate)
                                    habit.plant = Plant(plant: habit.plant.plant, stage: checkPlantGrowth(age: habit.age, log: habit.log.count))
                                    print(habit.plant.stage)
                                }
                            }
                        }
                )
                .simultaneousGesture(
                    TapGesture(count: 1)
                        .onEnded{ _ in
                            isShowingDetailView.toggle()
                        }
                )
                // rotates the plants to be in line with the plant box in content view
                .rotation3DEffect(.degrees(-45), axis: (x: 0.0, y: 0.0, z: 45.0))
            NavigationLink(destination: DetailView(habit: $habit), isActive: $isShowingDetailView) {
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var habit = Habit.sampleData[0][0]
    static var previews: some View {
        ButtonView(habit: .constant(habit))
    }
}


//This function will return 1 if habit is still a small plant, 2 if it should be a med plant and 3 if it should be a large plant.
func checkPlantGrowth(age: Int, log: Int)->Int{
    var totalCheckins = Double(age)
    var currentNumofCheckins = Double(log)
    var secondStageThreshold: Double = Double(totalCheckins / 3)
    var thirdStageThreshold: Double = secondStageThreshold * 2
    
    var imageStage = 1 //initalize to small size image
    if (currentNumofCheckins >= thirdStageThreshold){ //if they have checked in more than 2/3 of total checkins
        imageStage = 3
    } else if (currentNumofCheckins >= secondStageThreshold){ //plant should be on second stage
        imageStage = 2
    }
    return imageStage
}
