////
////  QuotesManager.swift
////  Practice
////
////  Created by Francesca Brown on 3/25/23.



//import Foundation
//import SwiftUI

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
    var id: UUID
    var quote: String = ""
//    let myFile: String = "motivators"

    init(id: UUID = UUID()){
        self.id = id
        let filePath = "motivations.txt"
//        if let randomLine = getRandomLineFromFile(filePath: filePath) {
//            self.quote = randomLine
//        } else {
//            self.quote = "hi"
//        }
        //print(filePath)
        if let fileContents = getFile(filePath: filePath) {
            //self.quote = fileContents
            self.quote = fileContents
        } else {
            self.quote = "hi"
        }
    
        
    }
//        self.id = id
//        self.quote = getRandomLineFromFile(filePath: "motivators")
//    }

//    private func printLine() -> String {
//        let filename = "motivators"
//        var quotesArray: [String] = []
//        do {
//            let contents = try String(contentsOfFile: filename)
//            let lines = contents.split(separator: "\n")
//            quotesArray = lines.map { String($0) }
//            return quotesArray.randomElement() ?? ""
//        } catch {
//            print("Error reading file:", error.localizedDescription)
//            return ""
//        }
//    }
    
    
    func getRandomLineFromFile(filePath: String) -> String? {
        do {
            // Read the contents of the file
            let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)

            // Separate the file contents into an array of lines
            let lines = fileContents.components(separatedBy: .newlines)

            // Get a random line from the array
            let randomLine = lines.randomElement()

            // Return the random line
            return randomLine
        } catch {
            // Catch any errors that occur
            print("Error reading file: \(error.localizedDescription)")
            return nil
        }
    }
//    let file = "file.txt" //this is the file. we will write to and read from it
//
//    let text = "some text" //just a text
//
//    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//
//        let fileURL = dir.appendingPathComponent(file)
//
//        //writing
//        do {
//            try text.write(to: fileURL, atomically: false, encoding: .utf8)
//        }
//        catch {/* error handling here */}
//
//        //reading
//        do {
//            let text2 = try String(contentsOf: fileURL, encoding: .utf8)
//        }
//        catch {/* error handling here */}
//    }

    
    func getFile(filePath: String) -> String? {
        
        do {
            // Read the contents of the file
            let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)

            // Separate the file contents into an array of lines
//            let lines = fileContents.components(separatedBy: .newlines)
//
//            // Get a random line from the array
//            let randomLine = lines.randomElement()

            // Return the random line
            return fileContents
        } catch {
            // Catch any errors that occur
            print("Error reading file: \(error.localizedDescription)")
            return nil
        }
    }

}










//func printLine() -> String {

//    let filename = "motivations.txt"
//
//    var text: String
//
//    var myCounter: Int
//
//
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: "strings")
//
//    else {
//
//        fatalError("Couldn't find \(filename) in main bundle.")
//
//    }
//
//
//
//    do {
//
//        let contents = try String(contentsOf: file, encoding: String.Encoding.utf8 )
//
//        let lines = contents.split(separator:"\n")
//
//        print(contents)
//
//        print(lines)
//
//        myCounter = lines.count
//
//        print(myCounter)
//
//        text = String(myCounter)
//
//        } catch {
//
//            return (error.localizedDescription)
//
//        }
//
//        return text
//
//
//
//}


//struct QuotesManager: Identifiable {
//    var id: UUID
//    var quote: String = ""
//    getLine()
//    }
    

//    init(id: UUID = UUID()){
//        self.id = id
//        let filePath = "motivations.txt"
//        if let randomLine = getRandomLineFromFile(filePath: filePath) {
//            self.quote = randomLine
//        } else {
//            self.quote = "hi"
//        }
//
//        if let fileContents = getFile(filePath: filePath) {
//            self.quote = fileContents
//        } else {
//            self.quote = "hi"
//        }
//
//
//    }
    
//    func getRandomLineFromFile(filePath: String) -> String? {
//        do {
//            let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
//
//            let lines = fileContents.components(separatedBy: .newlines)
//
//            let randomLine = lines.randomElement()
//
//            return randomLine
//        } catch {
//            print("Error reading file: \(error.localizedDescription)")
//            return nil
//        }
//    }
    
// joslenne test
//    func getLine() -> String {
//        let filename = "motivations.txt"
//        var str1: String
//        var myCounter: Int
//        do {
//            let contents = try String(contentsOfFile: filename)
//            let lines = contents.split(separator:"\n")
//            myCounter = lines.count
//            str1 = String(myCounter)
//            } catch {
//                return (error.localizedDescription)
//            }
//            print(str1)
//    }
    
    

    
//    func getFile(filePath: String) -> String? {
//        do {
//            let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
//
//            return fileContents
//        } catch {
//            print("Error reading file: \(error.localizedDescription)")
//            return nil
//        }
//    }









