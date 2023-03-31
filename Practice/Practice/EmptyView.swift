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
        Image("trowelemoji")
            .resizable()
        .frame(width: screenSize.width/8, height: screenSize.width/8)
        .rotation3DEffect(.degrees(-45), axis: (x: 0.0, y: 0.0, z: 45.0))
    }
}

struct EmptyVIew_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
