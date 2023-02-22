//
//  DetailView.swift
//  Practice
//
//  Created by Minh Nguyen on 2/20/23.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        List{
            Section(header: Text("Content Detail")){
                HStack {
                    Label(label: Text("Name"))
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
