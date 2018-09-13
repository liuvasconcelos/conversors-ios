//
//  ViewController.swift
//  Conversores
//
//  Created by Stant 02 on 28/08/18.
//  Copyright © 2018 Liu Vasconcelos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var unitTextFieldValue: UITextField!
    
    @IBOutlet weak var unit1Button: UIButton!
    @IBOutlet weak var unit2Button: UIButton!
    @IBOutlet weak var resultValue: UILabel!
    @IBOutlet weak var resultUnitText: UILabel!
    @IBOutlet weak var unitToBeConverted: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showNextPage(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Deseja mudar para qual unidade de medida?", message: "", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Temperatura", style: .default) { (action:UIAlertAction) in
            self.changeUnit(unitToBeConvertedText: "Temperatura", unit1: "Celsius", unit2: "Farenheint")
        }
        
        let action2 = UIAlertAction(title: "Peso", style: .default) { (action:UIAlertAction) in
            self.changeUnit(unitToBeConvertedText: "Peso", unit1: "Quilogramas", unit2: "Libras")
        }
        
        let action3 = UIAlertAction(title: "Moeda", style: .default) { (action:UIAlertAction) in
            self.changeUnit(unitToBeConvertedText: "Moeda", unit1: "Real", unit2: "Dólar")
        }
        
        let action4 = UIAlertAction(title: "Distância", style: .default) { (action:UIAlertAction) in
            self.changeUnit(unitToBeConvertedText: "Distância", unit1: "Metro", unit2: "Quilômetro")
        }
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(action3)
        alertController.addAction(action4)

        self.present(alertController, animated: true, completion: nil)
    }

    func changeUnit(unitToBeConvertedText: String, unit1: String, unit2: String) {
        unitToBeConverted.setTitle(unitToBeConvertedText, for: .normal)
        unit1Button.setTitle(unit1, for: .normal)
        unit2Button.setTitle(unit2, for: .normal)
        
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == unit1Button {
                unit2Button.alpha = 0.5
            } else {
                unit1Button.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch unitToBeConverted.currentTitle {
        case "Temperatura":
            calculateTemperature()
        case "Peso":
            calculateWeight()
        case "Moeda":
            calculateCurrency()
        default:
            calculateDistance()
        }
        
        view.endEditing(true)
        let result = Double(resultValue.text!)
        resultValue.text = String(format: "%.2f", result!)
    }
    
    func calculateTemperature() {
        let convertedValue = unitTextFieldValue.text!.replacingOccurrences(of: ",", with: ".")
        guard let temperature = Double(convertedValue) else {
            return
        }
        
        if unit1Button.alpha == 1.0 {
            resultUnitText.text = "Farenheint"
            resultValue.text = String(temperature * 1.8 + 32.0)
        }else {
            resultUnitText.text = "Celsius"
            resultValue.text = String((temperature - 32.0)/1.8)
        }
    }
    
    func calculateWeight() {
        let convertedValue = unitTextFieldValue.text!.replacingOccurrences(of: ",", with: ".")
        guard let weight = Double(convertedValue) else {
            return
        }
        
        if unit1Button.alpha == 1.0 {
            resultUnitText.text = "Libras"
            resultValue.text = String(weight/2.2046)
        }else {
            resultUnitText.text = "Kgs"
            resultValue.text = String(weight*2.2046)
        }
    }
    
    func calculateCurrency() {
        let convertedValue = unitTextFieldValue.text!.replacingOccurrences(of: ",", with: ".")
        guard let currency = Double(convertedValue) else {
            return
        }
        
        if unit1Button.alpha == 1.0 {
            resultUnitText.text = "Dólares"
            resultValue.text = String(currency/4.12)
        }else {
            resultUnitText.text = "Reais"
            resultValue.text = String(currency*4.12)
        }
    }
    
    func calculateDistance() {
        let convertedValue = unitTextFieldValue.text!.replacingOccurrences(of: ",", with: ".")
        guard let distance = Double(convertedValue) else {
            return
        }
        
        if unit1Button.alpha == 1.0 {
            resultUnitText.text = "Km"
            resultValue.text = String(distance/1000.0)
        }else {
            resultUnitText.text = "m"
            resultValue.text = String(distance*1000)
        }
    }
    
    
}

