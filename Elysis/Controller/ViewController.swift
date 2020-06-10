//
//  ViewController.swift
//  Elysis
//
//  Created by Gilberto Magno on 08/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

// LEMBRANDO QUE ISSO CASO FAÇAMOS POR MEIO DO CODIGO , TAMBEM PDOEMOS FAZER POR STORYBOARD SE FOR VONTADE DE VOCES !!! AINDA USAMOS IB NESSA, APENAS COMPONETIZAMOS ELA

import Cocoa

class ViewController: NSViewController {
// VAMO CRIAR TODOS COMPONENTES QUE PODEM APARECER NAS TELA AQUI  ---------------------------------------------------------------------------
    
    
    
    let botao = NSButton(frame: NSRect(x: 200, y: 200, width: 100, height: 100))
    
    
    
    
    
    
    
    
    
    
//-----------------------------------------------------------------------------
    
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: NSScreen.main!.frame.minX, y: NSScreen.main!.frame.minY, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        organizarConstraintsEDetalhes()
        view.addSubview(botao)
        botao.action = #selector(didTapButtonOpcoes(_:))
        
        // Do any additional setup after loading the view.
    }
    
    
    
// TORNAR POSSÍVEL O CLIQUE DO JOGADOR!!!

    
    
    
    
    
    
//QUANDO UMA TECLA É DO KEYBOARD É CLICADA! ------------------------------------------
    override func keyDown(with event: NSEvent) {
        
        
        
        
        //Se a tecla Espaço for clicada
        if event.keyCode == 36 {
            //Se estiver na tela principal, poderá clicar em   Continue, NovoJogo ou Opcoes {
            print("oi")
            
            //if Continuar {
            
            didTapButtonContinuar(NSButton())
            
            //}
            
            
            //if Novo Jogo {
            
            didTapButtonNovoJogo(NSButton())
            
            
            //}
            
            
            
            //if Novo Jogo {
            
            didTapButtonOpcoes(NSButton())
            
            //}
            
        //} Else Estiver na tela do jogo
            
            // if Tela de Jogo normal {
            
            //Passa o texto
            
       // } else BarradeTexto {
            
            didTapButtonConfirmar(NSButton())
            
      //  }
            
            
            
        }
        
        
        
        
        
        //Se a tecla Down/Baixo for clicada
        if event.keyCode == 125 {
            
            
            // X%3 , cada vez que clicar aumenta X em 1, assim mudando qual botao está em cima, comecando do 0 , que é o Continuar, 1 Novo jogo, 2 Opcoes :D
            
            
        }
        
        
        
        //Se a tecla Up/Cima for clicada
        if event.keyCode == 126 {
            
             // X%3 , cada vez que clicar Diminui X em 1, assim mudando qual botao está em cima, comecando do 0 , que é o Continuar, 1 Novo jogo, 2 Opcoes :D
            
            
        }
        
        
        
        
    }
//------------------------------------------------------------------------------------
    
    
    
    
    //Deixo esta função em aberto para criação de todas as constraints e coisas necessárias antes do jogo iniciar
        func organizarConstraintsEDetalhes() {
            
            
            
        }
        
    //Após o jogo ser iniciado , que tal termos também o jogo reconstruído nesta função?
        func reorganizarConstraintsEDetalhes(/*parametros = Dados da GameData*/) {
        
            
        }
    
    
    
    
    
    
    
// Funções dos Botoes do jogo, Continuar, NovoJogo, Opcoes, Confirmar e outros que podem existir---------------------------------------------------------------------
   @objc  func didTapButtonContinuar(_ Button: AnyObject){
        
    
    // MODEL FULLSCREEN CONTINUAR OU DIRETO PRO JOGO
    
        reorganizarConstraintsEDetalhes()
        
    }
    
    
    
    
    
    
    
    
    @objc  func didTapButtonNovoJogo(_ Button: AnyObject){
        //DIRETO PRO JOGO
        reorganizarConstraintsEDetalhes()
        
    }
    
    
    
    
    
    
    
    
    
    @objc  func didTapButtonOpcoes(_ Button: AnyObject){
        
        //MODEL FULLSCREEN
        
        self.view.window!.contentViewController = SettingsViewController()
    }
    
    
    
    
    
    
    
    
    @objc  func didTapButtonConfirmar(_ Button: AnyObject){
           
           // MAGIA DAS OPCOES E CAMINHOS AQUI
           
       }
//------------------------------------------------------------------------------------
    
    
    

    
    
    
    
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        self.view.window?.close()
        //Pass data to new view
    }
    
    
    
}

