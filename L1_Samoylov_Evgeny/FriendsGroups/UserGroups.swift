//
//  UserGroups.swift
//  L1_Samoylov_Evgeny
//
//  Created by Evgen on 02.04.2020.
//  Copyright © 2020 XXX. All rights reserved.
//

import UIKit
import Alamofire

class UserGroups: UITableViewController {

    var groups = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let parameters : Parameters = [
            "user_id" : Session.instance.userId,
            "access_token" : Session.instance.token,
            "fields" : "photo_50",
            "v" : "5.103"
        ]
        AF.request("https://api.vk.com/method/groups.get", parameters: parameters).responseJSON { response in
            
            print(response.value)
            
        }
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return groups.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserGroupCell", for: indexPath) as! UserGroupCell
        let group = groups[indexPath.row]
        cell.groupLabel.text = group.name
        cell.groupAvatar.image = group.avatar
        return cell
    }
    @IBAction func addGroup(segue: UIStoryboardSegue) {
          if segue.identifier == "addGroup" {
              let globalGroups = segue.source as! GlobalGroups
              if let indexPath = globalGroups.tableView.indexPathForSelectedRow {
                  let group = globalGroups.globalGroups[indexPath.row]
                  if !groups.contains(group) {
                      groups.append(group)
                      tableView.reloadData()
                  }
              }
          }

      }
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.reloadData()
        }

    }
    
}
