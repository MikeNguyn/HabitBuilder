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


//struct QuotesManager: Identifiable {
//
//    var id: UUID
//    var quote: String = ""
//
//    init(id: UUID = UUID()){
//      self.id = id
//      self.quote = getRandomLineFromFile(filePath: "motivations") ?? "No quote found."
//    }
//
//    func getRandomLineFromFile(filePath: String) -> String? {
//        do {
//            // Read the contents of the file
//            let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
//
//            // Separate the file contents into an array of lines
//            let lines = fileContents.components(separatedBy: .newlines)
//
//            // Get a random line from the array
//            let randomLine = lines.randomElement()
//
//            // Return the random line
//            return randomLine
//        } catch {
//            // Catch any errors that occur
//            print("Error reading file: \(error.localizedDescription)")
//            return nil
//        }
//    }
      
//      func getRandomLineFromFile(filePath: String) -> String? {
//          do {
//              let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
//              let lines = fileContents.components(separatedBy: .newlines)
//              let randomLine = lines.randomElement()
//              print("Random line: \(randomLine ?? "")")
//              return randomLine
//          } catch {
//              print("Error reading file: \(error.localizedDescription)")
//              return nil
//          }
//      }
    
//  }
    
//// Create an instance of QuotesManager
//let quotesManager = QuotesManager()
//
//// Get a random quote
//let randomQuote = quotesManager.getRandomLineFromFile(filePath: "motivators")
    
    
    
//
//
//
//
//
