//
//  UITextField + Extension.swift
//  AppAlcoholOrGasoline
//
//  Created by Gabriel Policastro on 16/03/23.
//

import Foundation
import UIKit

// Todos os meus TextFields conseguirão acessar a minha extension

extension UITextField {
    
    func addDoneButtonOnkeyBoard() {
        let doneToobar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToobar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(doneButtonAction))
        
        let items = [flexSpace, done]
        doneToobar.items = items
        doneToobar.sizeToFit() //  alinhar tudo
        self.inputAccessoryView = doneToobar
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
    
}
