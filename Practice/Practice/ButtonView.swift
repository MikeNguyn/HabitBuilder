//
//  ButtonView.swift
//  Practice
//
//  Created by Minh Nguyen on 2/20/23.
//

import SwiftUI

struct ButtonView: View {
    var buttonImage: Image
//    var widthPercentage: Int
//    var heightPercentage: Int
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            buttonImage
                .resizable()
            .frame(width: screenSize.width/10, height: screenSize.width/10)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonImage: Image("homeIcon"))
    }
}
