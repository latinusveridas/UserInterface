//
//  FollowersVC.swift
//  UserInterface
//
//  Created by Quentin Duquesne on 03/02/2020.
//  Copyright © 2020 Quentin Duquesne. All rights reserved.
//

import Foundation
import UIKit

class FollowersVC: UIViewController{
    
    var headerFrame: UIView!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setupHeader()
        headerFrame.backgroundColor = .brown
        // Do any additional setup after loading the view.
    }
    
    func setupHeader() {
    
        let headerFrame = UIView(frame: .zero)
        self.view.addSubview(headerFrame)
        
        headerFrame.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerFrame.topAnchor.constraint(equalTo: self.view.topAnchor),
            headerFrame.heightAnchor.constraint(equalToConstant: 50),
            headerFrame.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerFrame.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        self.headerFrame = headerFrame
        
    
    }
    
}
