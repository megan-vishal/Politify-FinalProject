//
//  nationwideBillsMainPageViewController.swift
//  Politify-FinalProject
//
//  Created by Apple on 7/29/20.
//  Copyright © 2020 Megan Vishal. All rights reserved.
//

import UIKit

class nationwideBillsMainPageViewController: UIViewController {

    @IBOutlet weak var nationwideBillsTable: UITableView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            nationwideBillsTable.delegate = self
           nationwideBillsTable.dataSource = self

            // Do any additional setup after loading the view.
        }

    }
    extension nationwideBillsMainPageViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("you clicked this cell")
        }
    }
    extension nationwideBillsMainPageViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1

        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NationBillCell", for: indexPath)
            cell.textLabel?.text = "USA Bill"
            return cell
        }
    }

    

   

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


