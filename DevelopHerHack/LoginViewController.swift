//
//  LoginViewController.swift
//  DevelopHerHack
//
//  Created by Da Y Mun on 8/28/15.
//  Copyright (c) 2015 danamun. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var buttonContainer: UIView!

    
    var type : String?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: "LoginViewController", bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        activityIndicator.hidden = true
        activityIndicator.hidesWhenStopped = true
        
        //UI

        signInButton.layer.borderWidth = BUTTONBORDER
        signInButton.layer.borderColor = DARKERBLUE.CGColor
        signUpButton.layer.borderWidth = BUTTONBORDER
        signUpButton.layer.borderColor = DARKERBLUE.CGColor
        
        buttonContainer.backgroundColor = LIGHTERGRAY
        self.view.backgroundColor = LIGHTERGRAY
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signUp(sender: AnyObject) {
        // Build the terms and conditions alert
        let alertController = UIAlertController(title: "Agree to terms and conditions",
            message: "Click I AGREE to signal that you agree to the End User Licence Agreement.",
            preferredStyle: UIAlertControllerStyle.Alert
        )
        alertController.addAction(UIAlertAction(title: "I AGREE",
            style: UIAlertActionStyle.Default,
            handler: { alertController in self.processSignUp()})
        )
        alertController.addAction(UIAlertAction(title: "I do NOT agree",
            style: UIAlertActionStyle.Default,
            handler: nil)
        )
        
        // Display alert
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    @IBAction func signIn(sender: AnyObject) {
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        
        var userName = username.text
        userName = userName.lowercaseString
        
        var userPassword = password.text
        
        PFUser.logInWithUsernameInBackground(userName, password:userPassword) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                dispatch_async(dispatch_get_main_queue()) {
                    self.setMainViewController()
                }
            } else {
                self.activityIndicator.stopAnimating()
                
                if let message: AnyObject = error!.userInfo!["error"] {
                    self.message.text = "\(message)"
                }
            }
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setMainViewController() {
        var mainVC: MainPageTableViewController = MainPageTableViewController(className: "User")
//        UINavigationBar.appearance().tintColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
//        UINavigationBar.appearance().barTintColor = UIColor(red: 0.59, green: 1.0, blue: 0.80, alpha: 1.0)
//        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        var navigationVC:UINavigationController = UINavigationController(rootViewController: mainVC)
        navigationVC.title = username.text
        
        self.view.window?.rootViewController = navigationVC
    }
    
    func processSignUp() {
        var userName = username.text
        var userPassword = password.text
        
        // Ensure username is lowercase
        userName = userName.lowercaseString
        
        // Start activity indicator
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        
        // Create the user
        var user = PFUser()
        user.username = userName
        user.password = userPassword
        user["usertype"] = self.type
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if error == nil {
                dispatch_async(dispatch_get_main_queue()) {
                    self.setMainViewController()
                }
            } else {
                self.activityIndicator.stopAnimating()
                if let message: AnyObject = error!.userInfo!["error"] {
                    self.message.text = "\(message)"
                }
            }
        }
    }
    
    


}
