//
//  FirstPageVC.swift
//  MasterCopy
//
//  Created by jeffery leo on 9/11/15.
//  Copyright (c) 2015 jeffery leo. All rights reserved.
//

import Foundation

class FirstPageVC: UIViewController {

    @IBOutlet var btnOpen: UIBarButtonItem!
    override func viewDidLoad() {
        btnOpen.target = self.revealViewController() //make the button effects out revealviewcontroller
        btnOpen.action = Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}
