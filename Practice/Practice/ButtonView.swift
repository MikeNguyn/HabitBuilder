//
//  ButtonView.swift
//  Practice
//
//  Created by Minh Nguyen on 2/20/23.
//
// A button view that allows a plant to become a button to be clicked on

import SwiftUI

struct ButtonView: View {
//    var widthPercentage: Int
//    var heightPercentage: Int
    @Binding var habit: Habit
    let screenSize: CGRect = UIScreen.main.bounds
    @GestureState var press = false
    @State var show = false
    @State var isShowingDetailView = false
    
    var body: some View {
        VStack{
//            if(habit.age == 0) {
//                habit.plant.image
//            } else if(habit.age > 5) {
//                habit.plant.image
//            } else {
//                habit.plant.image
//            }
            habit.plant.image
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
                .frame(width: screenSize.width/4.5, height: screenSize.width/4.5)
                // need to get width and height of original images, or resize all images to have the same w and h
                .scaleEffect(x: 1.5, y: 2.5, anchor: .center)
                .shadow(color: show ? Color.green.opacity(1): Color.white.opacity(0.0), radius: 5.0 )
                .scaleEffect(press ? 1.5: 1)
                .animation(.spring(response: 0.4, dampingFraction: 1))
                .highPriorityGesture(
                    LongPressGesture(minimumDuration: 0.5)
                        .updating($press) {currentState, gestureState, transaction in
                            gestureState = currentState
                        }
                        .onEnded{ value in
                            show.toggle()
                            print("the user checked off habit")
//                            print(habit.log)
                            let now = Date() // get the current date and time
                            let calendar = Calendar.current // get the current calendar
                            let todayDate = calendar.dateComponents([.year, .month, .day], from: now) // create a DateComponents object with just the year, month, and day
                            habit.log.insert(todayDate)
//                            print(habit.log)
                            
                        }
                )
                .simultaneousGesture(
                    TapGesture(count: 1)
                        .onEnded{ _ in
                            isShowingDetailView.toggle()
                        }
                )
            
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
