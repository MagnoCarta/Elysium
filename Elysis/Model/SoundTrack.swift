//
//  SoundTrack.swift
//  Elysis
//
//  Created by Gilberto Magno on 08/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa
import AVFoundation


enum MusicaOuEfeito: String {
    // Músicas

    case void = "void",
    segundaMusica = "segundaMusica",
    // Efeitos
    virarPagina = "virarPagina",
    abrirLivro = "abrirLivro"
}


class SoundTrack {
    var musicaOuEfeito : MusicaOuEfeito
    var musica : AVAudioPlayer
    init(musicaOuEfeito: MusicaOuEfeito) {
        self.musicaOuEfeito = musicaOuEfeito
        
        
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
        
        
    }
    
    
    func mudarVolume(volume: Float) {
        
        self.musica.volume = volume
        
        
        
    }
    
}







