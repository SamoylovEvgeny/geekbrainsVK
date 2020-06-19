//
//  GlobalGroups.swift
//  L1_Samoylov_Evgeny
//
//  Created by Evgen on 02.04.2020.
//  Copyright © 2020 XXX. All rights reserved.
//

import UIKit
import Alamofire

class GlobalGroups: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchGroups: UISearchBar!
    var globalGroups = [
        Group(name: "IOS Developers", avatar: UIImage(named: "ios")!),
        Group(name: "Apple", avatar: UIImage(named: "apple")!),
        Group(name: "Android", avatar: UIImage(named: "android")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchBar()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return globalGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GlobalGroupsCell", for: indexPath) as! GlobalGroupsCell
        let group = globalGroups[indexPath.row]
        cell.globalGroupLabel.text = group.name
        cell.globalGroupAvatar.image = group.avatar
        return cell
    }
    private func setUpSearchBar() {
        searchGroups.delegate = self
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let searchText = searchText
        loadSearchGroupsData(text: searchText)
    }
    func loadSearchGroupsData (text : String) {
        let parameters : Parameters = [
            "q" : text,
            "access_token" : Session.instance.token,
            "v" : "5.103"
        ]
        AF.request("https://api.vk.com/method/groups.search", parameters: parameters).responseJSON { response in
            
            print(response.value)
            
        }
    }
}
