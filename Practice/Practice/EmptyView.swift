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
        .frame(width: screenSize.width/5, height: screenSize.width/5)
    }
}

struct EmptyVIew_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
