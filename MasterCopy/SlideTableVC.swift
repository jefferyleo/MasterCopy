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
        tableArray = ["First","Second","Third"]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(tableArray[indexPath.row], forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = tableArray[indexPath.row]
        return cell
    }
}