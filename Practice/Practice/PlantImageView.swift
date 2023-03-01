//
//  PlantImageView.swift
//  Practice
//
//  Created by Matthew Mukai on 2/28/23.
//

import SwiftUI

struct PlantImageView: View {
    @State private var index: Int = 0
    let items = [Image("bananaemoji"),Image("roseemoji"),Image("tomatoemoji"),Image("cactusemoji")]
    var body: some View {

            return ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<self.items.count, id: \.self) { i in
                        Text("\(i)")
                            .foregroundColor(self.index == i ? .red : .black)
                            .frame(width: 20, height: 20)
                            .gesture(TapGesture().onEnded({ self.index = i }))
                    }
                }
            }
//            .frame(width: self, alignment: .leading)
    }
}

struct PlantImageView_Previews: PreviewProvider {
    static var previews: some View {
        PlantImageView()
    }
}
