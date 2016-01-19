//
//  ViewController.swift
//  tip calculator
//
//  Created by Patrick Yoon on 1/16/16.
//  Copyright © 2016 Patrick Yoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!

    var tipPercentages = [0.15, 0.20, 0.25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let possibleBillAmountText = billField.text
        var billAmount: Double
        
        if (possibleBillAmountText != "") {
            billAmount = Double.init(possibleBillAmountText!)!
        } else {
            billAmount = 0
        }
        let tip = billAmount * tipPercentage
        let total = billAmount + tip

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
     }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("default_tip_selected_index")
    }
}

