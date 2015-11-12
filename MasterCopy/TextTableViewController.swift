//
//  TextTableViewController.swift
//  MasterCopy
//
//  Created by aam imac on 30/10/2015.
//  Copyright © 2015 jeffery leo. All rights reserved.
//

import UIKit
import Foundation

class TextTableViewController: PFQueryTableViewController, UITextFieldDelegate{

    @IBOutlet var btnOpen: UIBarButtonItem!
    @IBOutlet var txtInput: UITextField!
    @IBOutlet var btnAdd: UIBarButtonItem!
    let textArray:NSMutableArray = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.txtInput.delegate = self
        btnOpen.target = self.revealViewController() //make the button effects out revealviewcontroller
        btnOpen.action = Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        txtInput.hidden = true;
        navigationItem.title = "Text"
        txtInput.returnKeyType = UIReturnKeyType.Done
        print(CustomFunction.getUsername())
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override init(style: UITableViewStyle, className:String!)
    {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder:NSCoder)
    {
        super.init(coder: aDecoder)!
        self.parseClassName = "TextCopied"
        self.textKey = "text"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    override func queryForTable() -> PFQuery {
        let query = PFQuery(className: "TextCopied")
        query.whereKey("username", equalTo: CustomFunction.getUsername())
        query.orderByDescending("createdAt")
        return query
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TextTableViewCell!
        if cell == nil
        {
            cell = TextTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        let copytext = PFQuery(className: "TextCopied")
        copytext.whereKey("username", equalTo: CustomFunction.getUsername())
        copytext.findObjectsInBackgroundWithBlock { (objects:[PFObject]?, error:NSError?) -> Void in
            if error == nil
            {
                for object in objects! as [PFObject]
                {
                    if let text = object["text"] as? String
                    {
                        cell?.lblText.text = text
                    }
                }
            }
        }
        
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let textCopied = PFQuery(className: "TextCopied")
        textCopied.whereKey("username", equalTo: CustomFunction.getUsername())
        textCopied.findObjectsInBackgroundWithBlock { (objects:[PFObject]?, error:NSError?) -> Void in
            if error == nil
            {
                for object in objects! as [PFObject]
                {
                    //let text = object["text"] as? String
                    if !self.textArray.containsObject(object["text"] as! String)
                    {
                        self.textArray.addObject(object["text"] as! String)
                    }
                }
            }
        }
        print("number of array \(self.textArray.count)")
        return self.textArray.count
    }
    @IBAction func btnAdd(sender: AnyObject)
    {
        txtInput.hidden = false;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        print("running here...")
//        if((self.txtInput.text?.isEmpty) != nil)
//        {
//            self.txtInput.resignFirstResponder()
//            return true
//        }
//        else
//        {
            self.txtInput.resignFirstResponder()
            saveTextToParse()
            return true
        //}
    }
    
    func saveTextToParse()
    {
        let query = PFQuery(className: "MasterCopy")
        query.findObjectsInBackgroundWithBlock
            {
                (objects:[PFObject]?, error:NSError?) -> Void in
                if error == nil
                {
                    let copy = PFObject(className: "TextCopied")
                    copy["username"] = PFUser.currentUser()!["username"] as? String
                    copy["text"] = self.txtInput.text
                    copy.saveInBackgroundWithBlock({ (success:Bool, error:NSError?) -> Void in
                        if(success)
                        {
                            let alertView = UIAlertController(title: "Saved", message: "save successfully.", preferredStyle: .Alert)
                            let newAlertView = UIAlertAction(title: "OK", style: .Default) { (action) in }
                            alertView.addAction(newAlertView)
                        }
                        else
                        {
                            NSLog("failed to save")
                        }
                    })
                }
        }
    }
    
    
    

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
