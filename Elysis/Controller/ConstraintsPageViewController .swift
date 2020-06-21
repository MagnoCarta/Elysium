//
//  Constraints .swift
//  Elysis
//
//  Created by Gilberto Magno on 15/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa


extension PageViewController {
    
    func organizarTela(dobradissa: PontaDaPaginaAnimada, dobradissaEsquerda: PontaDaPaginaAnimada) {
    self.view.addSubview(self.PaginaPrincipal)
    self.PaginaPrincipal.imageScaling = .scaleProportionallyDown
    self.PaginaPrincipal.translatesAutoresizingMaskIntoConstraints = false

    self.PaginaPrincipal.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    self.PaginaPrincipal.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
    self.PaginaPrincipal.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    
        
        
        
        self.PaginaPrincipal.addSubview(self.paginas[0].imagemAtual)
        self.paginas[0].imagemAtual.translatesAutoresizingMaskIntoConstraints = false
        let paginaDireitaBottomConstraint = self.paginas[0].imagemAtual.bottomAnchor.constraint(equalTo: self.PaginaPrincipal.bottomAnchor, constant: -72)
        paginaDireitaBottomConstraint.isActive = true
        let paginaDireitaHeightConstraint = self.paginas[0].imagemAtual.heightAnchor.constraint(equalToConstant: 658)
        paginaDireitaHeightConstraint.isActive = true
        let paginaDireitaxConstraint = self.paginas[0].imagemAtual.centerXAnchor.constraint(equalTo: self.PaginaPrincipal.centerXAnchor, constant: 0)
        paginaDireitaxConstraint.isActive = true
        self.view.addSubview(dobradissa)
        self.view.addSubview(dobradissaEsquerda)
        dobradissa.translatesAutoresizingMaskIntoConstraints = false
        dobradissa.bottomAnchor.constraint(equalTo: self.paginas[0].imagemAtual.bottomAnchor, constant: -8).isActive = true
        self.heightConstraint = dobradissa.heightAnchor.constraint(equalToConstant: 65)
        self.heightConstraint.isActive = true
        self.xConstraint = dobradissa.centerXAnchor.constraint(equalTo: self.paginas[0].imagemAtual.centerXAnchor, constant: 456)
        self.xConstraint.isActive = true
        dobradissa.imageScaling = .scaleProportionallyDown
        dobradissaEsquerda.translatesAutoresizingMaskIntoConstraints = false
        dobradissaEsquerda.bottomAnchor.constraint(equalTo: self.paginas[0].imagemAtual.bottomAnchor, constant: -8).isActive = true
        self.heightConstraint1 = dobradissaEsquerda.heightAnchor.constraint(equalToConstant: 65)
        self.heightConstraint1.isActive = true
        self.xConstraint1 = dobradissaEsquerda.centerXAnchor.constraint(equalTo: self.paginas[0].imagemAtual.centerXAnchor, constant: -456)
        self.xConstraint1.isActive = true
        dobradissaEsquerda.imageScaling = .scaleProportionallyDown
        self.paginas[0].imagemAtual.addSubview(self.lapisAnimado)
        self.lapisAnimado.translatesAutoresizingMaskIntoConstraints = false
        self.lapisAnimado.bottomConstraint = self.lapisAnimado.bottomAnchor.constraint(equalTo: self.paginas[0].imagemAtual.bottomAnchor, constant: -580)
        self.lapisAnimado.bottomConstraint.isActive = true
        self.lapisAnimado.heightConstraint = self.lapisAnimado.heightAnchor.constraint(equalToConstant: 50)
        self.lapisAnimado.heightConstraint.isActive = true
        self.lapisAnimado.xConstraint = self.lapisAnimado.centerXAnchor.constraint(equalTo: self.paginas[0].imagemAtual.centerXAnchor)
        self.lapisAnimado.xConstraint.isActive = true
        self.lapisAnimado.imageScaling = .scaleProportionallyDown
        self.view.addSubview(optionButton)
        self.optionButton.translatesAutoresizingMaskIntoConstraints = false
        self.optionButton.heightConstraint = self.optionButton.heightAnchor.constraint(equalToConstant: 60)
        self.optionButton.heightConstraint.isActive = true
        self.optionButton.xConstraint = self.optionButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        self.optionButton.xConstraint.isActive = true
        self.optionButton.topConstraint = self.optionButton.bottomAnchor.constraint(equalTo: self.paginas[0].imagemAtual.topAnchor,constant: 10)
        self.optionButton.topConstraint.isActive = true
        self.optionButton.imageScaling = .scaleProportionallyDown
    }
    
    func reorganizarConstraints(dobradissa: PontaDaPaginaAnimada,dobradissaEsquerda: PontaDaPaginaAnimada,LapisAnimado: LapisFeedback) {
        dobradissaEsquerda.removeFromSuperview()
        dobradissa.removeFromSuperview()
        LapisAnimado.removeFromSuperview()
        self.view.addSubview(LapisAnimado)
        self.view.addSubview(dobradissaEsquerda)
        self.view.addSubview(dobradissa)
        
    }
    
    
}
