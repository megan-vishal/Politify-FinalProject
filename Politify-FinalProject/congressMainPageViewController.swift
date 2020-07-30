//
//  congressMainPageViewController.swift
//  Politify-FinalProject
//
//  Created by Apple on 7/29/20.
//  Copyright © 2020 Megan Vishal. All rights reserved.
//

import UIKit

struct congressData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class congressMainPageTableViewController: UITableViewController {

     var tableViewData = [congressData]()
          
          override func viewDidLoad() {
              super.viewDidLoad()
              
              tableViewData = [
                            congressData(opened: false, title: "Kamala Harris", sectionData: ["Senator", "State: CA", "Party Affiliation: Democrat", "Viewpoints:", "   - Pro Choice", "   - Pro Tax on Wealth", "   - Pro Marijuana", "   - LGBTQ+ Supporter"]),
                            congressData(opened: false, title: "Dianne Feinstein", sectionData: ["Senator", "State: CA", "Party Affiliation: Democrat", "Viewpoints:", "   - Pro Choice", "   - LGBTQ+ Supporter"]),
                            congressData(opened: false, title: "Ro Khanna", sectionData: ["House of Representatives", "State: CA", "Congressional District: 17"]),
                            congressData(opened: false, title: "Anna Eshoo", sectionData: ["House of Representatives", "State: CA", "Party Affiliation: Democrat", "Congressional District: 18", "Viewpoints:", "   - Pro Choice", "   - Pro Women's Rights", "   - Pro Marijuana", "   - Pro Paid Maternal Leave", "   - LGBTQ+ Supporter", "   - Supporter of Criminal Rehabilitation Systems (re-entry into society)"]),
                            congressData(opened: false, title: "Zoe Lofgren", sectionData: ["House of Representatives", "State: CA", "Congressional District: 19"])]
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
                  guard let cellTitle = tableView.dequeueReusableCell(withIdentifier: "congressCellTitle") else {return UITableViewCell()}
                  cellTitle.textLabel?.text = tableViewData[indexPath.section].title
                cellTitle.textLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
                return cellTitle
              } else {
                  //USe different cell identifiers if needed
                  guard let cellData = tableView.dequeueReusableCell(withIdentifier: "congressCellData") else {return UITableViewCell()}
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
