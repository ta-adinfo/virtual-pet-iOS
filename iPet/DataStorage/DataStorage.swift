
// QUI SALVO E CARICO DATI SALVATI SE CI SONO QUANDO APRO L'APP
import Foundation

class DataStorage {
    private var PET_KEY = "PET_KEY"
    private var pet: PetModel

    init() {
        if let data = UserDefaults.standard.data(forKey: PET_KEY) {
            if let decoded = try? JSONDecoder().decode(PetModel.self, from: data) {
                self.pet = decoded
                print("Data successfully retrivered")
                return
            }
        }
        self.pet = PetModel(name: "alien", lastMeal: Date(), lastDrink: Date())
    }

    func loadData() -> PetModel {
        return pet
    }

    func saveData(pet: PetModel) {
        if let encoded = try? JSONEncoder().encode(pet) {
            UserDefaults.standard.setValue(encoded, forKey: PET_KEY)
            print("data saved :)")
        }
    }
}
