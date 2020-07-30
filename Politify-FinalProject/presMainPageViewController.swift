//
//  presMainPageViewController.swift
//  Politify-FinalProject
//
//  Created by Apple on 7/29/20.
//  Copyright © 2020 Megan Vishal. All rights reserved.
//

import UIKit

struct presData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class presMainPageTableViewController: UITableViewController {

    var tableViewData = [presData]()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           tableViewData = [
                            presData(opened: false, title: "Donald Trump", sectionData: ["Years Served: 2017-2021", "Party Affiliation: Republican", "Vice President: Michael Pence"]),
                            presData(opened: false, title: "Barack Obama", sectionData: ["Years Served: 2013-2017 & 2009-2013", "Party Affiliation: Democrat", "Vice President: Joseph Biden"]),
                            presData(opened: false, title: "George W. Bush", sectionData: ["Years Served: 2005-2009 & 2001-2005", "Party Affiliation: Republican", "Vice President: Richard Cheney"]),]
       }

       override func numberOfSections(in tableView: UITableView) -> Int {
           return tableViewData.count
       }

       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           if tableViewData[section].opened == true{
               return tableViewData[section].sectionData.count + 1
           } else {
               return 1
           }
       }
       
      override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let dataIndex = indexPath.row - 1
           if indexPath.row == 0 {
               guard let cellTitle = tableView.dequeueReusableCell(withIdentifier: "presCellTitle") else {return UITableViewCell()}
               cellTitle.textLabel?.text = tableViewData[indexPath.section].title
             cellTitle.textLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
             return cellTitle
           } else {
               //USe different cell identifiers if needed
               guard let cellData = tableView.dequeueReusableCell(withIdentifier: "presCellData") else {return UITableViewCell()}
               cellData.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex]
             cellData.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
               return cellData
           }
       }

       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           if indexPath.row == 0 {
           if tableViewData[indexPath.section].opened == true {
               tableViewData[indexPath.section].opened = false
               let sections = IndexSet.init(integer: indexPath.section)
               tableView.reloadSections(sections, with: .none)
           } else {
               tableViewData[indexPath.section].opened = true
               let sections = IndexSet.init(integer: indexPath.section)
               tableView.reloadSections(sections, with: .none)
           }
       }
       }

}

