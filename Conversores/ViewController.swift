//
//  ViewController.swift
//  Conversores
//
//  Created by Stant 02 on 28/08/18.
//  Copyright © 2018 Liu Vasconcelos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var temperatureTextFieldValue: UITextField!
    
    @IBOutlet weak var unit1Button: UIButton!
    @IBOutlet weak var unit2Button: UIButton!
    @IBOutlet weak var resultValue: UILabel!
    @IBOutlet weak var resultUnitText: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showNextPage(_ sender: UIButton) {
    }
    
    @IBAction func convert(_ sender: UIButton) {
    }
}

