//
//  PhotoViewController.swift
//  MasterCopy
//
//  Created by aam imac on 29/10/2015.
//  Copyright © 2015 jeffery leo. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet var btnOpen: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnOpen.target = self.revealViewController() //make the button effects out revealviewcontroller
        btnOpen.action = Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
