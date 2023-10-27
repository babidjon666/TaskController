//
//  Music.swift
//  TaskController
//
//  Created by Марк Поляков on 28.10.2023.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer!

func playSound(){
    let url = Bundle.main.url(forResource: "de144d31b1f3b3f", withExtension: "mp3")
    
    guard url != nil else{
        return
    }
    
    do{
        player = try AVAudioPlayer(contentsOf: url!)
        player?.play()
    }catch{
        print("error")
    }
}

func stopSound() {
    if player != nil && player.isPlaying {
        player.stop()
    }
}
