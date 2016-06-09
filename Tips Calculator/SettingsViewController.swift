//
//  SettingsViewController.swift
//  Tips Calculator
//
//  Created by Kali on 08/06/16.
//  Copyright © 2016 Vinter. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditDefaultTip(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(sender.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = defaults.integerForKey("defaultTip")
        switch defaultTip {
        case 0...2:
            defaultTipSegment.selectedSegmentIndex = defaultTip
        default:
            defaultTipSegment.selectedSegmentIndex = 0
        }
    }

}
