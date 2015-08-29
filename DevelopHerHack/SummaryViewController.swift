//
//  SummaryViewController.swift
//  DevelopHerHack
//
//  Created by Da Y Mun on 8/29/15.
//  Copyright (c) 2015 danamun. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    
    @IBOutlet weak var summaryTitle: UILabel!
    @IBOutlet weak var summaryDescription: UILabel!
    @IBOutlet weak var summaryMoney: UILabel!
    @IBOutlet weak var finishButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        summaryTitle.text = taskTitle as? String
        summaryDescription.text = taskDescription as? String
        summaryMoney.text = NSString(format: "%f", taskMoney!) as String
        
        //UI
        self.view.backgroundColor = LIGHTERGRAY
        finishButton.layer.borderWidth = BUTTONBORDER
        finishButton.layer.borderColor = DARKERBLUE.CGColor
    }

    @IBAction func onFinish(sender: UIButton) {
        self.dismissViewControllerAnimated(false, completion: nil);
        
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
