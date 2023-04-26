//
//  EmptyVIew.swift
//  Practice
//
//  Created by Minh Nguyen on 3/8/23.
//

import SwiftUI

struct EmptyView: View {
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        Image("Trowel2")
            .resizable()
            .frame(width: screenSize.width/4.5, height: screenSize.width/4.5)
            .rotation3DEffect(.degrees(-55), axis: (x: 5.0, y: 5.0, z: 45.0))
//            .rotationEffect(.degrees(-45))
            .scaleEffect(x: 1.2 , y: 1.33, anchor: .center)
    }
}

struct EmptyVIew_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
