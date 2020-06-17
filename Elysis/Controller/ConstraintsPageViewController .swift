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

    self.PaginaPrincipal.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
    self.PaginaPrincipal.heightAnchor.constraint(equalToConstant: 620*(self.view.frame.height/800)).isActive = true
    self.PaginaPrincipal.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    
        
        
        
        self.PaginaPrincipal.addSubview(self.paginasDireitas[0].imagemAtual)
        self.paginasDireitas[0].imagemAtual.translatesAutoresizingMaskIntoConstraints = false
        let paginaDireitaBottomConstraint = self.paginasDireitas[0].imagemAtual.bottomAnchor.constraint(equalTo: self.PaginaPrincipal.bottomAnchor, constant: -25)
        paginaDireitaBottomConstraint.isActive = true
        let paginaDireitaHeightConstraint = self.paginasDireitas[0].imagemAtual.heightAnchor.constraint(equalToConstant: 548)
        paginaDireitaHeightConstraint.isActive = true
        let paginaDireitaxConstraint = self.paginasDireitas[0].imagemAtual.centerXAnchor.constraint(equalTo: self.PaginaPrincipal.centerXAnchor, constant: 218)
        paginaDireitaxConstraint.isActive = true
        self.view.addSubview(dobradissa)
        self.view.addSubview(dobradissaEsquerda)
        dobradissa.translatesAutoresizingMaskIntoConstraints = false
        dobradissa.bottomAnchor.constraint(equalTo: self.PaginaPrincipal.bottomAnchor, constant: -25).isActive = true
        self.heightConstraint = dobradissa.heightAnchor.constraint(equalToConstant: 30)
        self.heightConstraint.isActive = true
        self.xConstraint = dobradissa.centerXAnchor.constraint(equalTo: self.PaginaPrincipal.centerXAnchor, constant: 431)
        self.xConstraint.isActive = true
        dobradissa.imageScaling = .scaleProportionallyDown
        dobradissaEsquerda.translatesAutoresizingMaskIntoConstraints = false
        dobradissaEsquerda.bottomAnchor.constraint(equalTo: self.PaginaPrincipal.bottomAnchor, constant: -26).isActive = true
        self.heightConstraint1 = dobradissaEsquerda.heightAnchor.constraint(equalToConstant: 30)
        self.heightConstraint1.isActive = true
        self.xConstraint1 = dobradissaEsquerda.centerXAnchor.constraint(equalTo: self.PaginaPrincipal.centerXAnchor, constant: -438)
        self.xConstraint1.isActive = true
        dobradissaEsquerda.imageScaling = .scaleProportionallyDown
    }
    
    func reorganizarConstraints(numeroDaPagina: Int,dobradissa: PontaDaPaginaAnimada,dobradissaEsquerda: PontaDaPaginaAnimada,lado: Bool) {
        dobradissaEsquerda.removeFromSuperview()
        dobradissa.removeFromSuperview()
        if lado {
            
            
            
            
        }else{
            for textos in paginasDireitas[numeroDaPagina].texto.arrayDeTextoNormal {
                textos.removeFromSuperview()
            }
            
            
        }
        self.view.addSubview(dobradissaEsquerda)
        self.view.addSubview(dobradissa)
        
    }
    
    
}
