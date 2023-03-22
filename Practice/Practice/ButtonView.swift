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
    let habit: Habit
    let screenSize: CGRect = UIScreen.main.bounds
    @GestureState var press = false
    @State var show = false
    
    var body: some View {
        habit.plant.image
        .resizable()
        .scaledToFit()
        .aspectRatio(contentMode: .fit)
        .cornerRadius(15)
        .frame(width: screenSize.width/5, height: screenSize.width/5)
        .shadow(radius: 5.0)
        .background(show ? Color.green.opacity(0.5): Color.white.opacity(0.0))
        .scaleEffect(press ? 2: 1)
        .animation(.spring(response: 0.4, dampingFraction: 1))
        .gesture(
            LongPressGesture(minimumDuration: 0.5)
                .updating($press) {currentState, gestureState, transaction in
                    gestureState = currentState
                }
                .onEnded{ value in
                    show.toggle()
                }
        )
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var habit = Habit.sampleData[0][0]
    static var previews: some View {
        ButtonView(habit: habit)
    }
}
