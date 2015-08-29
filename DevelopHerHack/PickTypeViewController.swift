//
//  PickTypeViewController.swift
//  DevelopHerHack
//
//  Created by Da Y Mun on 8/28/15.
//  Copyright (c) 2015 danamun. All rights reserved.
//

import UIKit

class PickTypeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickedChild(sender: AnyObject) {
        var logInVC: LoginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        logInVC.type = "Child"
        self.presentViewController(logInVC, animated: true, completion: nil)
    }
    @IBAction func clickedParent(sender: AnyObject) {
        var logInVC: LoginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        logInVC.type = "Parent"
        self.presentViewController(logInVC, animated: true, completion: nil)
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
