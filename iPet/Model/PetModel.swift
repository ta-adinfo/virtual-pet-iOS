
import Foundation

struct PetModel: Codable {
    var name: String
    var birthday = Date()
    var lastMeal: Date // tempo dall'ultimo pasto
    var lastDrink: Date // tempo dall' ultima volta che l ho fatto giocare

    var happinessLevel: String {
        hunger == "<3" || thirsty == ":)" ? "unhappy" : "happy"
    }
    
    var age: Int {
        let timeSince = calculateTimeSince(data: birthday) // calcalculateTimeSince la creo nel file Helper
        return timeSince
    }
    
    var hunger: String {
        let timeSince = calculateTimeSince(data: lastMeal) // calcolo tempo da ultimo pasto
        var string = "<3"
   
        switch timeSince {
        case 0..<20: string = "<3 <3 <3"
        case 20..<30: string = "<3 <3"
        case 30..<40: string = "<3"
        case 40...: string = "</3"
        default: string = "ok"
        }
        
        return string
    }
    
    var thirsty: String {
        let timeSince = calculateTimeSince(data: lastDrink) // calcolo tempo da ultima bevuta
        var string = ":)"

        switch timeSince {
        case 0..<20: string = ":) :) :)"
        case 20..<30: string = ":) :)"
        case 30..<40: string = ":)"
        case 40...: string = ":("
        default: string = "ok"
        }
        return string
    }
}
