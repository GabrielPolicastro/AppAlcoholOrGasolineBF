//
//  CalculatorVC.swift
//  AppAlcoholOrGasoline
//
//  Created by Gabriel Policastro on 09/03/23.
//

import UIKit

class CalculatorVC: UIViewController {
    
    var screen: CalculatorScreen? // criar a var pra screen
    var alert: Alert?
    
    
    override func loadView() {
        screen = CalculatorScreen() // gerada assim a instancia
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyBoardWhemTappedAround()
        alert = Alert(controller: self)
        screen?.delegate(delegate: self)
    }
    
    func hideKeyBoardWhemTappedAround() {
        let tap = UIGestureRecognizer(target: self, action: nil)
        tap.cancelsTouchesInView = false
        tap.delegate = self
//        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
    }
    
//    @objc private func dismissKeyBoard() {
//        view.endEditing(true)
//    }
    
    func validateTextFields() -> Bool {
        
        guard let ethanolPrice = screen?.ethanolPriceTextField.text else { return false }
        guard let gasPrice = screen?.gasPriceTextField.text else { return false }
        
        if ethanolPrice.isEmpty && gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe os valores do álcool e da gasolina")
            return false
        } else if ethanolPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe o valor do álcool")
            return false
        } else if gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe o valor da gasolina")
            return false
        }
        return true
    }
}

extension CalculatorVC: CalculatorScreenDelegate {
    func tappedCalculateButton() {
        
        if validateTextFields() {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            
            let ethanolPrice: Double = (formatter.number(from: screen?.ethanolPriceTextField.text ?? "0.0") as? Double) ?? 0.0
            let gasPrice: Double = (formatter.number(from: screen?.gasPriceTextField.text ?? "0.0") as? Double) ?? 0.0
            
            var vc: ResultVC?
            if ethanolPrice / gasPrice > 0.7 {
                print("Melhor Utilizar Gasolina!")
                vc = ResultVC(bestFuel: .gas)
            } else {
                print("Melhor Utilizar Álcool!")
                vc = ResultVC(bestFuel: .ethanol)
            }
            navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        }
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension CalculatorVC: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        let shouldDismissKeyBoard = !(touch.view is UIButton)
        if shouldDismissKeyBoard {
            view.endEditing(true)
        }
        return shouldDismissKeyBoard
        
    }
}










