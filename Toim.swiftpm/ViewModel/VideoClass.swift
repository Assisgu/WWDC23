//
//  File.swift
//  
//
//  Created by Gustavo Assis on 14/04/23.
//

import Foundation
import AVKit

func loopVideo(named videoName: String) -> AVPlayer{
    let url = Bundle.main.url(forResource: videoName, withExtension: "mp4")!
    let player = AVPlayer(url: url)
    player.actionAtItemEnd = .none
    
    NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: nil) { _ in
           player.seek(to: .zero)
           player.play()
       }
    
    player.play()
    return player
}
