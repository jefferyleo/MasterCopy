//
//  LoginViewController.swift
//  MasterCopy
//
//  Created by jeffery leo on 9/3/15.
//  Copyright (c) 2015 jeffery leo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate, PFLogInViewControllerDelegate {

    @IBOutlet var txtUsername: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var btnSignIn: UIButton!
    @IBOutlet var btnSignUp: UIButton!
    @IBOutlet var btnOpen: UIBarButtonItem!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.txtUsername.delegate = self
        self.txtPassword.delegate = self
        // Do any additional setup after loading the view.
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func DismissKeyboard()
    {
        view.endEditing(true)
    }
    
    @IBAction func btnSignIn(sender: AnyObject)
    {
        self.DismissKeyboard() //dismiss the keyboard before validate the login credential
        if (txtUsername.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).uppercaseString.isEmpty || txtPassword.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).isEmpty)
        {
            //let alertView = UIAlertView(title: "Error", message: "Cannot blank", delegate: self, cancelButtonTitle: "OK")
            let alertView = UIAlertController(title: "Error", message: "Cannot blank", preferredStyle: .Alert)
            let newAlertView = UIAlertAction(title: "OK", style: .Default) { (action) in }
            alertView.addAction(newAlertView)
            self.presentViewController(alertView, animated: true) { }
            //alertView.show()
        }
        else if (txtUsername.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).uppercaseString != "" && txtPassword.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) != "")
        {
            SwiftSpinner.show("Signing In...", animated: true)
            PFUser.logInWithUsernameInBackground(txtUsername.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).uppercaseString, password: txtPassword.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()), block: { (user:PFUser?, error:NSError?) -> Void in
                if(error != nil)
                {
                    SwiftSpinner.hide()
                    var errorCode = error?.code
                    switch errorCode!
                    {
                    case 100:
                        var alertView = UIAlertView(title: "No connection found", message: "Try Again!", delegate: self, cancelButtonTitle: "OK")
                        alertView.show()
                        break
                    case 101:
                        var alertView = UIAlertView(title: "Incorrect Username or Password", message: "Try Again!", delegate: self, cancelButtonTitle: "OK")
                        alertView.show()
                        break
                    case 209:
                        var alertView = UIAlertView(title: "Invalid Token", message: "Ignore!", delegate: self, cancelButtonTitle: "OK")
                        alertView.show()
                        break
                    default:
                        break
                    }
                }
                else
                {
                    SwiftSpinner.hide()
                    self.performSegueWithIdentifier("GotoLogin", sender: self)
                }
            })
        }
    }
    
    @IBAction func unwindToLoginViewController(segue: UIStoryboardSegue) {
//        if segue.identifier == "gotoLogout"
//        {
//            var alertView = UIAlertView(title: "Logout", message: "Are you sure you want to logout?", delegate: self, cancelButtonTitle: "Cancel")
//            alertView.addButtonWithTitle("Sure")
//            alertView.show()
//            //self.performSegueWithIdentifier("gotoLogout", sender: self)
//        }
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
