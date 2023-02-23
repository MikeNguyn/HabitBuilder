//
//  ButtonView.swift
//  Practice
//
//  Created by Minh Nguyen on 2/20/23.
//

import SwiftUI

struct ButtonView: View {
    let habit: Habit
//    var widthPercentage: Int
//    var heightPercentage: Int
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            habit.plant
                .resizable()
            .frame(width: screenSize.width/7, height: screenSize.width/7)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var habit = Habit.sampleData[0]
    static var previews: some View {
        ButtonView(habit: habit)
    }
}
