//
//  MasterVC.swift
//  SplitViewDemo
//
//  Created by Apple on 03/05/18.
//  Copyright © 2018 Vignesh. All rights reserved.
//

import UIKit

protocol userSelctionDelegate: class {
    func userSelected(_ newUser: User)
}


class MasterVC: UITableViewController {

    var users = [User]()
    weak var delegate: userSelctionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let user1 = User(name: "Mike", grade: "5", address: "AAA - NNN - SSS")
        let user2 = User(name: "Jane", grade: "8", address: "SSS-II-HH-TT")
        let user3 = User(name: "matt", grade: "2", address: "HHH- KK-L-IIO")
        let user4 = User(name: "Bella", grade: "8", address: "KK-KA-OO-TT")
        
        self.users.append(user1)
        self.users.append(user2)
        self.users.append(user3)
        self.users.append(user4)
        
    }

  

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "masterCell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = users[indexPath.row]
        delegate?.userSelected(selectedUser)
        
        if let detailVC = delegate as? DetailVC,
            let detailNavCon = detailVC.navigationController {
            splitViewController?.showDetailViewController(detailNavCon, sender: nil)
        }
    }

}






