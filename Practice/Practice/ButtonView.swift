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
    
    var body: some View {
        VStack {
            habit.plant.image
                .resizable()
            .frame(width: screenSize.width/5, height: screenSize.width/5)
            .rotation3DEffect(.degrees(-45), axis: (x: 0.0, y: 0.0, z: 45.0))
            .shadow(radius: 5.0)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var habit = Habit.sampleData[0][0]
    static var previews: some View {
        ButtonView(habit: habit)
    }
}
