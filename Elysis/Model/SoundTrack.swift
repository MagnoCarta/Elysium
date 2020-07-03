//
//  SoundTrack.swift
//  Elysis
//
//  Created by Gilberto Magno on 08/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa
import AVFoundation



protocol SoundTrackDelegate {
    func mudarVolume(volume: Float,musica: AVAudioPlayer) 
}

enum MusicaOuEfeito: String {
    // Músicas
    
    case void = "void",
    segundaMusica = "segundaMusica",
    // Efeitos
    virarPagina = "virarPagina",
    abrirLivro = "abrirLivro"
}


class SoundTrack {
    var musicaOuEfeito : MusicaOuEfeito = .void
    var musica : AVAudioPlayer
    static let soundTrack = SoundTrack()
    private init() {
        
        let assets = NSDataAsset(name: musicaOuEfeito.rawValue)!
        let data = assets.data
        try! musica = AVAudioPlayer(data: data)
        switch musicaOuEfeito {
        case .void, .segundaMusica:
            musica.volume = UserDefaults.standard.float(forKey: "bgmVolume")
        case .virarPagina, .abrirLivro:
            musica.volume = UserDefaults.standard.float(forKey: "sfxVolume")
        }
        musica.play()
        musica.numberOfLoops = -1
    }
    
    
    func mudarVolume() {
        musica.stop()
        switch musicaOuEfeito {
        case .void, .segundaMusica:
            musica.volume = UserDefaults.standard.float(forKey: "bgmVolume")
        case .virarPagina, .abrirLivro:
            musica.volume = UserDefaults.standard.float(forKey: "sfxVolume")
        }
        
        musica.play()
        musica.numberOfLoops = -1
    }
    
    
    
    
    
}










