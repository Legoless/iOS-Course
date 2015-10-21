//: DN2

import Foundation


class Game {
    
    private enum Status
    {
        case Wishlist, Purchased, InProgress, Finished
    }
    
    var name : String
    var dateAdded : NSDate = NSDate()
    var dateModified : NSDate = NSDate()
    var priority : UInt
    private var status : Status = .Wishlist
    
    init (name: String, priority: UInt = 0)
    {
        self.name = name
        self.priority = priority
    }
    
    
    func description () -> String {
        return "Game: \(name) status: \(status)"
    }
}

let diablo3 = Game(name: "Diablo 3")

print(diablo3.description())

diablo3.status = .InProgress



