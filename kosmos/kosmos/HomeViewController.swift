//
//  HomeViewController.swift
//  kosmos
//
//  Created by MAIN on 03.31.17.
//  Copyright © 2017 University of Washington. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var addPressView: UIView!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var buttonView: UIView!
    
    @IBOutlet weak var addSkin: UIButton!
    @IBOutlet weak var addMakeup: UIButton!
    @IBOutlet weak var addHair: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exitButton.isHidden = true;
        addPressView.isHidden = true;
        addSkin.isHidden = true;
        addMakeup.isHidden = true;
        addHair.isHidden = true;
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.dismissKeyboard));
        
        view.addGestureRecognizer(tap);
        // Do any additional setup after loading the view.
    }
    @IBAction func pressAdd(_ sender: Any) {
//        addPressView.isHidden = false;
//        exitButton.isHidden = false;
//        addButton.isHidden = true;
        changeHiddenState(hide: false);
        self.view.bringSubview(toFront: buttonView);
    }

    @IBAction func pressExit(_ sender: Any) {
        changeHiddenState(hide: true);
//        exitButton.isHidden = true;
//        addPressView.isHidden = true;
//        addButton.isHidden = false;
    }
    
    func dismissKeyboard() {
        view.endEditing(true);
    }
    
    func changeHiddenState(hide: Bool) {
        exitButton.isHidden = hide;
        addButton.isHidden = !hide;
        addPressView.isHidden = hide;
        addSkin.isHidden = hide;
        addMakeup.isHidden = hide;
        addHair.isHidden = hide;
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
