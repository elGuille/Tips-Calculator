//
//  ViewController.swift
//  Tips Calculator
//
//  Created by Kali on 31/05/16.
//  Copyright © 2016 Vinter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipControll: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipLabel.text = "$0.00"
        totalAmountLabel.text = "$0.00"
        
        self.billField.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateTip()
    }

    func updateTip() {
        var tipPercentages = [0.18, 0.20, 0.22]
        let percentage = tipPercentages[tipControll.selectedSegmentIndex]

//        let billAmmount = Double(billField.text!)
        let billAmmount = (billField.text! as NSString).doubleValue
        let tip = billAmmount * percentage
        let total = billAmmount + tip
        
        tipLabel.text = "$\(tip)"
        totalAmountLabel.text = "$ \(total)"
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var defaultTip = defaults.integerForKey("defaultTip")
        switch defaultTip {
        case 0...2:
            tipControll.selectedSegmentIndex = defaultTip
        default:
            tipControll.selectedSegmentIndex = 0
        }

        
    }
    
}

