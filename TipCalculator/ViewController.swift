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
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let y = defaults.object(forKey: "percent") as? Float{
            percentSlider.value = y
            tipControl.selectedSegmentIndex = -1
        }else{
            percentSlider.value = Float(tipPercent[tipControl.selectedSegmentIndex]*100)
            defaults.set(percentSlider.value, forKey: "percent")
        }
        percentLabel.text = String(format: "%.f %%" ,(percentSlider.value))
        if let z = defaults.object(forKey: "onSwitch") as? Bool {
            vatSwitch.isOn = z
            if vatSwitch.isOn {
                vatLabel.text = "( -10% VAT for your Total)"
            }else{
                vatLabel.text=""
            }
        }else{
            vatSwitch.isOn = false
            vatLabel.text=""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        defaults.set(billField.text, forKey: "old")
        
        
        if (billField.isEditing == false) {
            percentSlider.value = Float(tipPercent[tipControl.selectedSegmentIndex]*100)
            percentLabel.text = String(format: "%.f %%" ,(percentSlider.value))
        }
        defaults.set(percentSlider.value, forKey: "percent")
        TipCalulator(bill: bill, percent: Double(percentSlider.value/100))
        
        
    }
    
    @IBAction func checkPercentSlider(_ sender: Any) {
        defaults.set(percentSlider.value, forKey: "percent")
        percentLabel.text = String(format: "%.f %%" ,(percentSlider.value))
        TipCalulator(bill: Double(billField.text!) ?? 0, percent: Double(percentSlider.value/100))
        tipControl.selectedSegmentIndex = -1
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
        defaults.set(vatSwitch.isOn, forKey: "onSwitch")
    }
    @IBAction func deleteUserDefaults(_ sender: Any) {
        
        // create the alert
        let alert = UIAlertController(title: "UIAlertController", message: "Do you want to delete bill", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {(ACTION) in
            self.defaults.removeObject(forKey: "old")
            self.defaults.removeObject(forKey: "percent")
            self.defaults.removeObject(forKey: "onSwitch")
            self.billField.text=""
            self.tipLabel.text="$0"
            self.totalLabel.text="$0"
            self.vatSwitch.isOn = false
            self.vatLabel.text = ""
            self.tipControl.selectedSegmentIndex = 0
            self.percentSlider.value = Float(self.tipPercent[self.tipControl.selectedSegmentIndex]*100)
            self.percentLabel.text = String(format: "%.f %%" ,(self.percentSlider.value))
            self.total = 0
            }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let SettingVC : VCSetting = segue.destination as! VCSetting
        if vatSwitch.isOn {
            SettingVC.total = Double(total*1.1)
        }else{
            SettingVC.total = Double(total)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let x = defaults.object(forKey: "old") as? String {
            billField.text = x
            if let y = defaults.object(forKey: "percent") as? Double{
                TipCalulator(bill: Double(billField.text!) ?? 0, percent: y/100)
            }
        }
    }
   
}

