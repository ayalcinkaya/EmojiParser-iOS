//
//  FTEmojiParser.swift
//  FTEmojiParser
//
//  Created by Florent TM on 19/04/2016.
//  Copyright © 2016 Florent THOMAS-MOREL. All rights reserved.
//

import Foundation
import UIKit

let tables:[String:String] = [
    ":)" : "😊",
    ";)" : "😉",
    ":D" : "😃",
    ":(" : "😞",
    ":/" : "🙁",
    ":$" : "😳",
    ":P" : "😜",
    ":*" : "😘",
    "<3" : "❤️",
    ":O" : "😮",
    "(y)" : "👍🏼",
    "3:)" : "😈",
    "-_-" : "😑",
    ":-*" : "😘",
    ":'(" : "😢",
    ":-)" : "😊",
    ";-)" : "😉",
    "O:)" : "😇",
    ":poop:" : "💩"
]

extension UITextView{
    
    func postParseStringForEmoji() -> String{
        let indexes = Array(Set(tables.keys.map({ (key) -> Int in
            return key.characters.count
        }))).sort { (a, b) -> Bool in
            return a > b
        }
        "fdsq".replace
        
        var k = 0
        var res = self.text
        for i in 0...self.text.characters.count-1{
            let text = res.substringFromIndex(self.text.startIndex.advancedBy(i))
           if text.characters.count > 0 {
                for n in indexes{
                    if(text.characters.count >= n){
                        let key = text.substringToIndex(text.startIndex.advancedBy(n))
                        if let emoji = tables[key]{
                            let range = res.startIndex.advancedBy(i-k)..<res.startIndex.advancedBy(i+n-k)
                            res.replaceRange(range, with: emoji)
                            k+=1
                        }
                    }
                }
            }
        }
        return res
    }
    
    func lastParseStringForEmoji() -> String {
        let indexes = Array(Set(tables.keys.map({ (key) -> Int in
            return key.characters.count
        }))).sort { (a, b) -> Bool in
            return a > b
        }
        
        if self.text.characters.count > 0 {
            for n in indexes{
                if(self.text.characters.count >= n){
                    let key = self.text.substringFromIndex(self.text.endIndex.advancedBy(-n))
                    if let emoji = tables[key]{
                        let range = self.text.endIndex.advancedBy(-n)..<self.text.endIndex
                        var newText = self.text
                        newText.removeRange(range)
                        newText = newText + emoji
                        return newText
                    }
                }
            }
        }
        return self.text
    }
    
}