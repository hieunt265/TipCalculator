//
//  ViewController.swift
//  TipCalculator
//
//  Created by HieuNT on 5/21/17.
//  Copyright © 2017 HieuNT. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var vatLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var percentSlider: UISlider!
    @IBOutlet weak var vatSwitch: UISwitch!
    
    let tipPercent = [0.18,0.2, 0.25]
    var total = Double()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        percentSlider.value = Float(tipPercent[tipControl.selectedSegmentIndex]*100)
        percentLabel.text = String(format: "%.f %%" ,(percentSlider.value))
            vatLabel.text=""
            vatSwitch.isOn = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let SettingVC : VCSetting = segue.destination as! VCSetting
        if vatSwitch.isOn {
            SettingVC.total = Double(total*1.1)
        }else{
            SettingVC.total = Double(total)
        }
    }
    
    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
    }
    
    func TipCalulator(bill:Double,percent:Double){
        let tip =   bill * percent
        total = bill + tip
        tipLabel.text =  String(format: "$%.2f" ,(tip))
        if vatSwitch.isOn {
            totalLabel.text = String(format: "$%.2f" ,(total*1.1))
        }else{
            totalLabel.text = String(format: "$%.2f" ,(total))
        }
        
    }
    
    
    @IBAction func calulatorTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        TipCalulator(bill: bill, percent: tipPercent[tipControl.selectedSegmentIndex])
        percentSlider.value = Float(tipPercent[tipControl.selectedSegmentIndex]*100)
        percentLabel.text = String(format: "%.f %%" ,(percentSlider.value))
    }
    
    @IBAction func checkPercentSlider(_ sender: Any) {
        percentLabel.text = String(format: "%.f %%" ,(percentSlider.value))
        TipCalulator(bill: Double(billField.text!) ?? 0, percent: Double(percentSlider.value/100))
    }
    
    @IBAction func checkSwitch(_ sender: Any) {
        if vatSwitch.isOn {
            vatLabel.text = "( -10% VAT for your Total)"
            totalLabel.text = String(format: "$%.2f" ,(total*1.1))
        }
        else
        {
            vatLabel.text = ""
            totalLabel.text = String(format: "$%.2f" ,(total))
        }
    }
   
}

