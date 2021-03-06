//
//  ViewController.swift
//  carML
//
//  Created by Sergio Abarca Flores on 28-06-18.
//  Copyright © 2018 sergioeabarcaf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var modelSegmentController: UISegmentedControl!
    @IBOutlet weak var extrasSwitchController: UISwitch!
    @IBOutlet weak var kmsSliderController: UISlider!
    @IBOutlet weak var statusSegmentController: UISegmentedControl!
    @IBOutlet weak var kmsLabel: UILabel!
    @IBOutlet weak var valuePredictedLabel: UILabel!
    
    let cars = Cars()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stackView.setCustomSpacing(70, after: self.statusSegmentController)
        
        self.calculateValue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateValue() {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        
        let formattedKms = formatter.string(for: self.kmsSliderController.value) ?? "0"
        self.kmsLabel.text = "Kilometraje: \(formattedKms)"
        
        if let prediction = try? self.cars.prediction(modelo: Double(self.modelSegmentController.selectedSegmentIndex), extras: Double(self.extrasSwitchController.isOn ? Double(1.0) : Double(0.0)), kilometraje: Double(self.kmsSliderController.value), estado: Double(self.statusSegmentController.selectedSegmentIndex)){
            
            let clampValue = max(500, prediction.precio)
            
            formatter.numberStyle = .currency
            self.valuePredictedLabel.text = formatter.string(for: clampValue)
        }
        else{
            self.valuePredictedLabel.text = "Error"
        }
        

    }
    
}

