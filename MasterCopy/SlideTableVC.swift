//
//  SlideTableVC.swift
//  MasterCopy
//
//  Created by jeffery leo on 9/10/15.
//  Copyright (c) 2015 jeffery leo. All rights reserved.
//

import Foundation

class SlideTableVC:UITableViewController {
    var tableArray = [String]()
    
    override func viewDidLoad() {
        tableArray = ["Text","Photo","Logout"]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(tableArray[indexPath.row], forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = tableArray[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row == 2)
        {
            var alertView = UIAlertView(title: "Logout", message: "Are you sure you want to logout?", delegate: self, cancelButtonTitle: "Cancel")
            alertView.addButtonWithTitle("Sure")
            alertView.show()
        }
    }
    
    func alertView(alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int)
    {
        if(buttonIndex == 0)
        {
            return
        }
        else
        {
            PFUser.logOut()
            self.navigationController?.popViewControllerAnimated(true)
            //self.dismissViewControllerAnimated(true, completion: nil)
            self.performSegueWithIdentifier("gotoLogout", sender: self)
            //self.presentViewController(LoginViewController(), animated: true, completion: nil)
        }
    }
}