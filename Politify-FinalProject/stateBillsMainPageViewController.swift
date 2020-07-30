//
//  stateBillsMainPageViewController.swift
//  Politify-FinalProject
//
//  Created by Apple on 7/29/20.
//  Copyright © 2020 Megan Vishal. All rights reserved.
//

import UIKit

class stateBillsMainPageViewController: UIViewController {
    
    
    
    @IBOutlet weak var stateBillsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stateBillsTable.delegate = self
       stateBillsTable.dataSource = self

        // Do any additional setup after loading the view.
    }

}
extension stateBillsMainPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you clicked this cell")
    }
}
extension stateBillsMainPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateBillCell", for: indexPath)
        cell.textLabel?.text = "California Bill"
        return cell
    }
}
