
import Foundation
import SwiftUI

// metto il vm come estensione di gameview
extension GameView {
    class PetViewModel: ObservableObject {
        @Published var pet: PetModel
        private var storage = DataStorage()
        init() {
            pet = storage.loadData()
        }

        func saveData() {
            objectWillChange.send() // da capire
            storage.saveData(pet: pet)
        }

        func food() {
            pet.lastMeal = Date() // azzero il tempo dall'ultimo pasto cosi non ha fame
            saveData()
        }

        func drink() {
            pet.lastDrink = Date()
            saveData()
        }

        // resetto vita quando muore
        func resetAge() {
            pet.birthday = Date()
            saveData()
        }

        // resetto nome con uno casuale quando muore DA FARE
        func resetName() {}

        // età in ore
        var ageInHours: Int {
            let secondsInAnHour = 3600
            return pet.age / secondsInAnHour
        }
        
    }
}
