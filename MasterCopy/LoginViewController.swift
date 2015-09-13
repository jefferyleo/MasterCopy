//
//  LoginViewController.swift
//  MasterCopy
//
//  Created by jeffery leo on 9/3/15.
//  Copyright (c) 2015 jeffery leo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

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
