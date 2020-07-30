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
                                repsData(opened: false, title: "Anna Eshoo", sectionData: ["House of Representatives", "State: CA", "Party Affiliation: Democrat", "Congressional District: 18"]),
                                repsData(opened: false, title: "Title 2", sectionData: ["Cell 1", "Cell 2", "Cell 3"]),
                                repsData(opened: false, title: "Title 3", sectionData: ["Cell 1", "Cell 2", "Cell 3"]),]
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
                  guard let cell = tableView.dequeueReusableCell(withIdentifier: "repsCell") else {return UITableViewCell()}
                  cell.textLabel?.text = tableViewData[indexPath.section].title
                  return cell
              } else {
                  //USe different cell identifiers if needed
                  guard let cell = tableView.dequeueReusableCell(withIdentifier: "repsCell") else {return UITableViewCell()}
                  cell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex]
                  return cell
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
