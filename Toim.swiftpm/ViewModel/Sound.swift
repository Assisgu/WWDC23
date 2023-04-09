//
//  Sound.swift
//  Toim
//
//  Created by Gustavo Assis on 09/04/23.
//

import Foundation
import AVFoundation

class Sound {
    var audioPlayer: AVAudioPlayer!
    
    func playSounds(_ soundFileName : String) {
        guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "mp3") else {
            fatalError("audio \(soundFileName) n encontrado")
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print(error.localizedDescription)
        }
        audioPlayer.play()
    }
}
