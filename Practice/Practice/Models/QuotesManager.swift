////
////  QuotesManager.swift
////  Practice
////
////  Created by Francesca Brown on 3/25/23.



//import Foundation
//import SwiftUI

// with credit to Joslenne Peña and Paul Cantrell

import Foundation
import SwiftUI

public func randomQuote() -> String{
    return String(quotesArray.randomElement() ?? "")
}

private let quotesArray: [Substring] = {
    do {
        guard let filename = Bundle.main.path(forResource: "motivators", ofType: "txt") else{
            fatalError("Could not find motivators file")
        }
        let contents = try String(contentsOfFile: filename)
        return contents.split(separator: "\n")
    } catch{
        print("Error reading file:", error.localizedDescription)
        return []
    }
        
}()
