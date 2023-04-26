//
//  QuotesView.swift
//  Practice
//
//  Created by Francesca Brown on 3/24/23.
//

import SwiftUI

struct QuotesView: View {
//    let myQuote: QuotesManager
//
//    init(myQuote: QuotesManager){
//        self.myQuote = myQuote
//
//    }

    var body: some View {
        Text(randomQuote())
            .position(x:200,y:100).foregroundColor(.teal)
            .font(.system(size: 20)
                .bold())
                  

//        Text(printLine())
//            .position(x:100,y:100).foregroundColor(.teal).font(.system(size: 20)
//                .bold())
//            .frame(width: screenSize.width/8, height: screenSize.width/5)
    }
    
    
//    func printLine() -> String {
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
//            return str1
//    }
//
    
    
//    func getText() -> String{
//        let filePath = "motivations.txt"
//        var str1: String
//        if let randomLine = getRandomLineFromFile(filePath: filePath) {
//            self.quote = randomLine`
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
//    }
//    func printLine() -> String {
//
//        let filename = "motivations.txt"
//
//        var text: String
//
//        var myCounter: Int
//
//
//
//        guard let file = Bundle.main.url(forResource: filename, withExtension: "strings")
//
//        else {
//
//            fatalError("Couldn't find \(filename) in main bundle.")
//
//        }
//
//
//
//        do {
//
//            let contents = try String(contentsOf: file, encoding: String.Encoding.utf8 )
//
//            let lines = contents.split(separator:"\n")
//
//            print(contents)
//
//            print(lines)
//
//            myCounter = lines.count
//
//            print(myCounter)
//
//            text = String(myCounter)
//
//            } catch {
//
//                return (error.localizedDescription)
//
//            }
//
//            return text
//
//
//
//    }
//    func getRandomLineFromFile(filePath: String) -> String? {
//            do {
//                let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
//
//                let lines = fileContents.components(separatedBy: .newlines)
//
//                let randomLine = lines.randomElement()
//
//                return randomLine
//            } catch {
//                print("Error reading file: \(error.localizedDescription)")
//                return nil
//            }
//        }
}




struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
//        let myQuote: QuotesManager = QuotesManager()
//        QuotesView(myQuote: myQuote)
        QuotesView()
    }


//    static let myQuote = QuotesManager(quote: "This is a test quote.")
//
//    static var previews: some View {
//        QuotesView(myQuote: myQuote)
//    }
//    static var previews: some View {
//        let myQuote: QuotesManager = QuotesManager()
//        QuotesView(myQuote: myQuote)
////        QuotesView()
//    }

}
