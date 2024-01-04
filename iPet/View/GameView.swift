
import SwiftUI

struct GameView: View {
    @StateObject private var pet_view_model = PetViewModel()
    @EnvironmentObject private var AudioP: AudioPlayer_
    private let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()

    var body: some View {
        // generate new pet
        if pet_view_model.pet.hunger == "</3" || pet_view_model.pet.thirsty == ":(" {
            Text("generate new pet")
                // Text("年齢 \(pet_view_model.pet.age)")
                .padding(.bottom, 10)
            Button_(btn_action: {
                pet_view_model.food()
                pet_view_model.drink()
                pet_view_model.resetAge()
                AudioP.happy_sound_()
            }, btn_image: "reset")
        }

        // my pet
        else {
            VStack {
                Spacer()
                HStack {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 130, height: 130) // Imposta la dimensione del cerchio

                        Image(.mametchi)
                            .resizable()
                            .frame(width: 80, height: 80)
                    }
                    .padding()
                    Spacer()
                    VStack(alignment: .leading) {
                        Text(pet_view_model.pet.name)
                        Text("年齢 \(pet_view_model.pet.age)")
                        Text(pet_view_model.pet.happinessLevel)
                    }
                }
                .padding(50)

                HStack {
                    Text("hp   ")
                    Text(pet_view_model.pet.hunger)
                        .foregroundStyle(Color(.systemRed))
                    Spacer()
                }
                .padding(.bottom, 10)
                HStack {
                    Text("happiness   ")
                    Text(pet_view_model.pet.thirsty)
                        .foregroundStyle(Color(.systemYellow))
                    Spacer()
                }
                Spacer()
                HStack {
                    Button_(btn_action: {
                        pet_view_model.food()
                        AudioP.btn_sound_()
                    }, btn_image: "sushi")
                    Spacer()
                    Button_(btn_action: {
                        pet_view_model.drink()
                        AudioP.btn_sound_()
                    }, btn_image: "milk")
                }

                .padding(.horizontal, 50)
            }
            .padding()
            .onReceive(timer) {
                _ in pet_view_model.saveData()
            }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
