
import SwiftUI

struct Button_: View {
    @State var btn_action: () -> Void
    @State var btn_image: String
    @EnvironmentObject var AudioP : AudioPlayer_
    var body: some View {
        Button(action: {
            btn_action()
            AudioP.btn_sound_()
            
        }, label: {
            Image(btn_image)
                .resizable()
                .frame(width: 30, height: 30)
                .padding()
                .frame(width: 100, height: 45)
                .background(Color(uiColor: .systemBlue))
                .cornerRadius(10)
        })
    }
}

#Preview {
    Button_(btn_action: {
        //
    }, btn_image: "sushi")
}