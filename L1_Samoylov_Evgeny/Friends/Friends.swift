//
//  Friends.swift
//  L1_Samoylov_Evgeny
//
//  Created by Evgen on 01.04.2020.
//  Copyright © 2020 XXX. All rights reserved.
//

import UIKit
import Alamofire
struct Section {
    var symbol: String
    var name: [Item]
}

class Friends: UITableViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchFriendsBar: UISearchBar!
    let friendsLoader = FriendsLoader()
    var friends = [Item]()
    var friendSection = [Section]()
  
 
    func sortFriends (friends: [Item]) {
        let friendDictionary = Dictionary(grouping: friends, by: ({$0.firstName.prefix(1)}))
        friendSection = friendDictionary.map {Section (symbol: String($0.key), name: $0.value)}
        friendSection.sort {$0.symbol < $1.symbol}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsLoader.loadFriendsData() { [weak self] users in
            self?.friends = users
            self?.setUpSearchBar()
            self?.sortFriends(friends: self!.friends)
            self?.tableView.reloadData()
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendSection.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendSection[section].name.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendCell
        let friend = friendSection[indexPath.section].name[indexPath.row]
        let url = URL(string: friendSection[indexPath.section].name[indexPath.row].avatar)
        cell.friendLabel.text = friend.firstName + " " + friend.lastName
        cell.friendAvatar.image = UIImage(data: try! Data(contentsOf: url!))
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FriendsPhotos" {
            let userPhotoVC = segue.destination as! FriendsPhotos
            if let index = tableView.indexPathForSelectedRow {
                let user = friendSection[index.section].name[index.row]
                userPhotoVC.ownerId = user.id
            }
        }
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("FriendSectionCell", owner: self, options: nil)?.first as! FriendSectionCell
        let section = friendSection[section].symbol
        headerView.sectionLabel.text = section
        return headerView
    }
    private func setUpSearchBar() {
        searchFriendsBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            sortFriends(friends: friends)
            tableView.reloadData()
            return
        }
        let currentFriends = friends.filter({ friend -> Bool in
            friend.firstName.lowercased().contains(searchText.lowercased())
        })
        sortFriends(friends: currentFriends)
        tableView.reloadData()
    }
    
}
