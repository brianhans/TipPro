//
//  ViewController.swift
//  TipPro
//
//  Created by Brian Hans on 6/21/16.
//  Copyright © 2016 Brian Hans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountTextField: UITextField!
    @IBOutlet weak var totalAmountTextField: UITextField!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func calculateTip(sender: AnyObject) {
        guard let billAmount = Double(billAmountField.text!) else{
            //show error
            billAmountField.text = ""
            tipAmountTextField.text = ""
            totalAmountTextField.text = ""
            return
        }
        
        var tipPercentage = 0.0
        switch tipSelector.selectedSegmentIndex {
        case 0:
            tipPercentage = 0.15
        case 1:
            tipPercentage = 0.18
        case 2:
            tipPercentage = 0.2
        default:
            break
        }
        
        let roundedBillAmount = round(billAmount * 100)/100
        let tipAmount = roundedBillAmount * tipPercentage
        let roundedTipAmount = round(tipAmount * 100)/100
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        if (!billAmountField.editing) {
            billAmountField.text = String(format: "%.2f", roundedBillAmount)
        }
        
        tipAmountTextField.text = String(format: "%.2f", roundedTipAmount)
        totalAmountTextField.text = String(format: "%.2f", totalAmount)
    }
}

