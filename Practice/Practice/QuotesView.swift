//
//  QuotesView.swift
//  Practice
//
//  Created by Francesca Brown on 3/24/23.
//

import SwiftUI

struct QuotesView: View {
//    let myQuote: QuotesManager
    var body: some View {
//        Text(myQuote.quote)
//            .position(x:100,y:100)
        Text("One day, or day one? You decide.")
            .position(x:200,y:100).foregroundColor(.teal).font(.system(size: 20)
                .bold())
//            .frame(width: screenSize.width/8, height: screenSize.width/5).
    }
}

struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
//        let myQuote: QuotesManager = QuotesManager()
//        QuotesView(myQuote: myQuote)
        QuotesView()
    }

}
