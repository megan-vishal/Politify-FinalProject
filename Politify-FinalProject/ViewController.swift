//
//  ViewController.swift
//  Politify-FinalProject
//
//  Created by Apple on 7/28/20.
//  Copyright © 2020 Megan Vishal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBAction func governorsButton(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Sorry!", message: "This Feature Is Not Yet Available", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

