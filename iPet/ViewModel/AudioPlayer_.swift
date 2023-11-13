//
//  AudioPlayer_.swift
//  iPet
//
//  Created by emanuel primavera on 31/10/23.
//

import AVKit
import Foundation

class AudioPlayer_: ObservableObject {
    private var btn_sound: AVAudioPlayer!
    private var happy_sound: AVAudioPlayer!
    private var unhappy_sound: AVAudioPlayer!

    init() {
        if let BtnSound = Bundle.main.path(forResource: "btn_sound", ofType: "wav") {
            do {
                btn_sound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: BtnSound))
            }
            catch {
                print("error")
            }

            if let HappySound = Bundle.main.path(forResource: "happy_sound", ofType: "wav") {
                do {
                    happy_sound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: HappySound))
                }
                catch { print("error") }
            }
            if let UnhappySound = Bundle.main.path(forResource: "unhappy_sound", ofType: "wav") {
                do {
                    unhappy_sound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: UnhappySound))
                }
                catch { print("error") }
            }
        }
    }

    func btn_sound_() {
        btn_sound.play()
        btn_sound.volume = 0.2
    }

    func happy_sound_() {
        happy_sound.play()
        btn_sound.volume = 0.2
    }

    func unhappy_sound_() {
        unhappy_sound.play()
        btn_sound.volume = 0.2
    }
}
