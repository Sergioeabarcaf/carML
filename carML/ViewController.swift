//
//  ViewController.swift
//  carML
//
//  Created by Sergio Abarca Flores on 28-06-18.
//  Copyright © 2018 sergioeabarcaf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var modelSegmentController: UISegmentedControl!
    @IBOutlet weak var extrasSwitchController: UISwitch!
    @IBOutlet weak var kmsSliderController: UISlider!
    @IBOutlet weak var statusSegmentController: UISegmentedControl!
    @IBOutlet weak var kmsLabel: UILabel!
    @IBOutlet weak var valuePredictedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateValue() {
    }
    
}

