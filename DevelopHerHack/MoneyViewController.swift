//
//  MoneyViewController.swift
//  DevelopHerHack
//
//  Created by Da Y Mun on 8/29/15.
//  Copyright (c) 2015 danamun. All rights reserved.
//

import UIKit

class MoneyViewController: UIViewController {
    
    @IBOutlet weak var moneyLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        println("MONEYCONTROLLER CREATED");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func moneyValue(sender: AnyObject) {
        taskMoney = (moneyLabel.text as NSString).floatValue
    }
    
    @IBAction func clickCreate(sender: AnyObject) {
        taskMoney = (moneyLabel.text as NSString).floatValue
        let query = PFUser.query()?.whereKey("username", equalTo: taskAvatar!)
        print("task avatar: \(taskAvatar)!")
        var otheruser : PFUser = query?.getFirstObject() as! PFUser
        
        var task = PFObject(className: "FamilyTasks")
        task.setObject(taskTitle!, forKey: "title")
        task.setObject(taskDescription!, forKey: "description")
        task.setObject(taskMoney!, forKey: "value")
        task.setObject(otheruser, forKey: "towho")
        task.setObject(PFUser.currentUser()!, forKey: "fromwho")
        task.setObject(false, forKey: "completed")
        task.saveInBackground()
        
        
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
