//
//  repsMainPageViewController.swift
//  Politify-FinalProject
//
//  Created by Apple on 7/29/20.
//  Copyright © 2020 Megan Vishal. All rights reserved.
//

import UIKit

struct repsData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class repsMainPageTableViewController: UITableViewController {

    var tableViewData = [repsData]()
          
          override func viewDidLoad() {
              super.viewDidLoad()
              
              tableViewData = [
                                repsData(opened: false, title: "Ro Khanna", sectionData: ["House of Representatives", "State: CA", "Congressional District: 17"]),
                                repsData(opened: false, title: "Anna Eshoo", sectionData: ["House of Representatives", "State: CA", "Party Affiliation: Democrat", "Congressional District: 18", "Viewpoints:", "   - Pro Choice", "   - Pro Women's Rights", "   - Pro Marijuana", "   - Pro Paid Maternal Leave", "   - LGBTQ+ Supporter", "   - Supporter of Criminal Rehabilitation Systems (re-entry into society)"]),
                                repsData(opened: false, title: "Zoe Lofgren", sectionData: ["House of Representatives", "State: CA", "Congressional District: 19"])]
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
                  guard let cellTitle = tableView.dequeueReusableCell(withIdentifier: "repsCellTitle") else {return UITableViewCell()}
                  cellTitle.textLabel?.text = tableViewData[indexPath.section].title
                cellTitle.textLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
                return cellTitle
              } else {
                  //USe different cell identifiers if needed
                  guard let cellData = tableView.dequeueReusableCell(withIdentifier: "repsCellData") else {return UITableViewCell()}
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
