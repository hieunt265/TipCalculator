//
//  VCSetting.swift
//  TipCalculator
//
//  Created by HieuNT on 5/28/17.
//  Copyright © 2017 HieuNT. All rights reserved.
//

import UIKit

class VCSetting: UIViewController , UITableViewDataSource,UITableViewDelegate{
    
    let currency: [String] = ["Việt Nam Đồng", "Euro", "Bảng Anh", "Japanese Yên", "Nhân Dân Tệ"]
    let sysbol: [String] = ["VND", "€", "£", "¥", "元"]
    
    @IBOutlet weak var tbvCountry: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tbvCountry.register(UITableViewCell.self, forCellReuseIdentifier: "VCSetting")
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
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        self.navigationController!.popToRootViewController(animated: true)
        
        
    }
    
    
    
    
}
