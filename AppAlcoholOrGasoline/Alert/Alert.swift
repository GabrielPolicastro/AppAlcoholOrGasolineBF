//
//  Alert.swift
//  AppAlcoholOrGasoline
//
//  Created by Gabriel Policastro on 13/03/23.
//

import UIKit

class Alert {

    let controller: UIViewController
    
    init(controller: UIViewController) { // construtor do alert
        self.controller = controller
    }
    
    func showAlertInformation(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert) //criei o alert
        let okButton = UIAlertAction(title: "Ok", style: .default)// criei o botao
        alertController.addAction(okButton)//adicionei o botao no alert
        controller.present(alertController, animated: true)
        
        // para exibir o alert, precisamos criar um Presentor, apenas quem consegue acessar o Presentor eh uma UIViewController,
    }
}
