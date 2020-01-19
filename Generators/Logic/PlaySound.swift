//
//  PlaySound.swift
//  Generators
//
//  Created by Slavik on 14.01.2020.
//  Copyright © 2020 Slavik. All rights reserved.
//

import Foundation
import AVFoundation

// MARK: - Audio player
var audioPlayer: AVAudioPlayer?

func playSound(sound: String, format: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: format) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
            print("sound played, path: \(path)")
        } catch {
            print("Could not find or play file")
        }
    }
}
