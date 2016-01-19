//
//  SettingsViewController.swift
//  tip calculator
//
//  Created by Patrick Yoon on 1/18/16.
//  Copyright © 2016 Patrick Yoon. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var defaultTipPercentagePicker: UIPickerView!
    
    var pickerData: [String] = [String]()
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerData = ["15%", "20%", "25%"]
        
        self.defaultTipPercentagePicker.delegate = self
        self.defaultTipPercentagePicker.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaultTipPercentagePicker.selectRow(
            defaults.integerForKey("default_tip_selected_index"),
            inComponent: 0,
            animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView
    {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.blackColor()
        pickerLabel.text = pickerData[row]
        pickerLabel.font = UIFont.systemFontOfSize(17)
        pickerLabel.textAlignment = NSTextAlignment.Center
        return pickerLabel
    }
    
    @IBAction func onDone(sender: UIBarButtonItem) {
        let defaults = NSUserDefaults.standardUserDefaults()
    defaults.registerDefaults(["default_tip_selected_index": 0])
        defaults.setInteger(selectedIndex, forKey: "default_tip_selected_index")
        defaults.synchronize()
        self.parentViewController
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onCancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}