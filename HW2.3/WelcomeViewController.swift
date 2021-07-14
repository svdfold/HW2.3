//
//  WelcomeViewController.swift
//  HW2.3
//
//  Created by Mike Albright on 14.07.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var user: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradient(upperColor: .systemPink,
                         bottomColor: .systemBlue)
        
        if let user = user {
            welcomeLabel.text = "Welcome, \(user)! 👋"
        }
    }
}
