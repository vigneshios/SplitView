
//
//  DetailVC.swift
//  SplitViewDemo
//
//  Created by Apple on 03/05/18.
//  Copyright © 2018 Vignesh. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    // Outlet
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var user: User? {
        didSet {
            refreshUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func refreshUI() {
        loadViewIfNeeded()
        nameLabel.text = user?.name
        gradeLabel.text = user?.grade
        addressLabel.text = user?.address
    }
}


extension DetailVC: userSelctionDelegate {
    func userSelected(_ newUser: User) {
        user = newUser
    }
    
    
    
}



