//
//  VCSetting.swift
//  TipCalculator
//
//  Created by HieuNT on 5/28/17.
//  Copyright © 2017 HieuNT. All rights reserved.
//

import UIKit

class VCSetting: UIViewController , UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var totalDollarLabel: UILabel!
    @IBOutlet weak var totalCurrencyLabel: UILabel!
    @IBOutlet weak var sysboyCurrencyLabel: UILabel!
    
    
    let currency: [String] = ["VietNam(Dong)", "Eurozone(EUR)", "United Kingdom(GBP)", "Japanese Yên(JPY)", "China(PNY)","Australia(AUD)","Indonesia(IDR)","Hong Kong(HKD)","Korea(KRW)"]
    let sysbol: [String] = ["VND", "€", "£", "¥", "¥","؋","Rp","$","₩"]
    let Country: [String] = ["flag_vietnam", "flag_EU", "flag_english", "flag_japanese", "flag_china", "flag_australia","flag_indonesia","flag_hongkong","flag_korea"]
    
    var total = Double()
    
    
    @IBOutlet weak var tbvCountry: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tbvCountry.register(UITableViewCell.self, forCellReuseIdentifier: "VCSetting")
        totalDollarLabel.text = String(format: "%.2f" ,(total))
        totalCurrencyLabel.text =  String(format: "%.2f" ,total)
        sysboyCurrencyLabel.text = "$"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currency.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tbvCountry.dequeueReusableCell(withIdentifier: "VCSetting") as UITableViewCell!
                // set the text from the data model
        cell.textLabel?.text = self.currency[indexPath.row]
        cell.imageView?.image = UIImage(named: self.Country[indexPath.row])
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        switch indexPath.row {
        case 0:
            totalCurrencyLabel.text =  String(format: "%.2f" ,total*22.72)
            sysboyCurrencyLabel.text = self.sysbol[indexPath.row]
            break
            
        case 1:
            totalCurrencyLabel.text =  String(format: "%.2f" ,total*0.89)
            sysboyCurrencyLabel.text = self.sysbol[indexPath.row]
            break
            
        case 2:
            totalCurrencyLabel.text =  String(format: "%.2f" ,total*0.78)
            sysboyCurrencyLabel.text = self.sysbol[indexPath.row]
            break
            
        case 3:
            totalCurrencyLabel.text =  String(format: "%.2f" ,total*11.28)
            sysboyCurrencyLabel.text = self.sysbol[indexPath.row]
            break
            
        case 4:
            totalCurrencyLabel.text =  String(format: "%.2f" ,total*6.86)
            sysboyCurrencyLabel.text = self.sysbol[indexPath.row]
            break
            
        case 5:
            totalCurrencyLabel.text =  String(format: "%.2f" ,total*1.34)
            sysboyCurrencyLabel.text = self.sysbol[indexPath.row]
            break
            
        case 6:
            totalCurrencyLabel.text =  String(format: "%.2f" ,total*13298.04)
            sysboyCurrencyLabel.text = self.sysbol[indexPath.row]
            break
            
        case 7:
            totalCurrencyLabel.text =  String(format: "%.2f" ,total*7.79)
            sysboyCurrencyLabel.text = self.sysbol[indexPath.row]
            break
            
        case 8:
            totalCurrencyLabel.text =  String(format: "%.2f" ,total*1119.35)
            sysboyCurrencyLabel.text = self.sysbol[indexPath.row]
            break
            
        default:
            totalCurrencyLabel.text =  String(format: "%.2f" ,total)
            sysboyCurrencyLabel.text = "$"
        }
    }
    
    @IBAction func reloadTbvButton(_ sender: Any) {
        tbvCountry.reloadData()
        totalCurrencyLabel.text =  String(format: "%.2f" ,total)
        sysboyCurrencyLabel.text = "$"
    }
    
    
    
}
