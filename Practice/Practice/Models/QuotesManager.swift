////
////  QuotesManager.swift
////  Practice
////
////  Created by Francesca Brown on 3/25/23.
////
//

import Foundation
import SwiftUI

struct QuotesManager: Identifiable {
    var id: UUID
    var quote: String = ""
    
    init(id: UUID = UUID()){
        self.id = id
        self.quote = printLine()
    }
    
    private func printLine() -> String {
        let filename = "motivators"
        var quotesArray: [String] = []
        do {
            let contents = try String(contentsOfFile: filename)
            let lines = contents.split(separator: "\n")
            quotesArray = lines.map { String($0) }
            return quotesArray.randomElement() ?? ""
        } catch {
            print("Error reading file:", error.localizedDescription)
            return ""
        }
    }
}





