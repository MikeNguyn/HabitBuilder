//
//  QuotesView.swift
//  Practice
//
//  Created by Francesca Brown on 3/24/23.
//

import SwiftUI

//This quotes view displays the random quote from motivators.

struct QuotesView: View {
    var body: some View {
        var quote = randomQuote()
        Text(quote)
            .position(x:0,y:0).foregroundColor(.teal)
            .font(.system(size: 20)
            .bold())
            .onAppear{
                quote = randomQuote()
            }
    }

}




struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesView()
    }

}
