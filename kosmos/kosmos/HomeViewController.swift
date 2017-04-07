//
//  HomeViewController.swift
//  kosmos
//
//  Created by MAIN on 03.31.17.
//  Copyright © 2017 University of Washington. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var addPressView: UIView!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var buttonView: UIView!
    
    @IBOutlet weak var addSkin: UIButton!
    @IBOutlet weak var addMakeup: UIButton!
    @IBOutlet weak var addHair: UIButton!
    
    @IBOutlet weak var productTableView: UITableView!
    
    let products = [CosmeticItem(name: "Naked Flushed", brand: "Urban Decay"), CosmeticItem(name: "Lash Mascara", brand:"Buxom")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exitButton.isHidden = true
        addPressView.isHidden = true
        addSkin.isHidden = true
        addMakeup.isHidden = true
        addHair.isHidden = true
        
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.dismissKeyboard))
        
//        view.addGestureRecognizer(tap);
        
        productTableView.delegate = self
        productTableView.dataSource = self
        
        
    }
    @IBAction func pressAdd(_ sender: Any) {
        changeHiddenState(hide: false)
        self.view.bringSubview(toFront: buttonView)
    }

    @IBAction func pressExit(_ sender: Any) {
        changeHiddenState(hide: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath as IndexPath)
        cell.textLabel?.text = products[indexPath.item].name
        cell.detailTextLabel?.text = products[indexPath.item].brand
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "cellSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cellSegue" {
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func changeHiddenState(hide: Bool) {
        exitButton.isHidden = hide
        addButton.isHidden = !hide
        addPressView.isHidden = hide
        addSkin.isHidden = hide
        addMakeup.isHidden = hide
        addHair.isHidden = hide
    }
    
    struct CosmeticItem {
        var name: String
        var brand: String
        
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

}
