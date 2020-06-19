//
//  NewsController.swift
//  L1_Samoylov_Evgeny
//
//  Created by Evgen on 17.04.2020.
//  Copyright © 2020 XXX. All rights reserved.
//

import UIKit

class NewsController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("NewsCell", owner: self, options: nil)?.first as! NewsCell


        return cell
    }
    
}
