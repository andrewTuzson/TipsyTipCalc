//
//  ViewController.swift
//  TipsyTipCalc
//
//  Created by Andrew Tuzson on 3/8/18.
//  Copyright © 2018 Andrew Tuzson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var tip = TipModel(billAmount: 0.0, tipPercent: 0.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        setTipCalculationValues()
        updateUI()
    }
    
    func setTipCalculationValues() {
        tip.tipPercent = Double(tipPercentSlider.value)
        tip.billAmount = ((textField.text)! as NSString).doubleValue
        tip.calculateTip()
    }
    
    func updateUI() {
        tipLabel.text = String(format: "$%0.2f", tip.tipAmount)
        totalLabel.text = String(format: "$%0.2f", tip.totalAmount)
        tipPercentLabel.text = "Tip: \(Int(tipPercentSlider.value * 100))%"
    }
    
    // Actions
    @IBAction func billAmountDidChange(_ sender: Any) {
        setTipCalculationValues()
        updateUI()
    }
    
    @IBAction func tipPercentageChanged(_ sender: Any) {
        setTipCalculationValues()
        updateUI()
    }
    
}

