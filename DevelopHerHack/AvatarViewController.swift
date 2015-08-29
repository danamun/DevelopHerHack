//
//  AvatarViewController.swift
//  DevelopHerHack
//
//  Created by Da Y Mun on 8/29/15.
//  Copyright (c) 2015 danamun. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController {
    var pageIndex : Int = 0

    @IBOutlet weak var avatar1: UIButton!
    @IBOutlet weak var avatar2: UIButton!
    @IBOutlet weak var avatar3: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func clickedAvatar1(sender: AnyObject) {
        avatar1.selected = true
        avatar2.selected = false
        avatar3.selected = false
        taskAvatar = "kevin"
    }
    @IBAction func clickedAvatar2(sender: AnyObject) {
        avatar1.selected = false
        avatar2.selected = true
        avatar3.selected = false
        taskAvatar = "dana"
    }
    @IBAction func clickedAvatar3(sender: AnyObject) {
        avatar1.selected = false
        avatar2.selected = false
        avatar3.selected = true
        taskAvatar = "betsy"
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
