//
//  TaskViewController.swift
//  DevelopHerHack
//
//  Created by Da Y Mun on 8/29/15.
//  Copyright (c) 2015 danamun. All rights reserved.
//

import UIKit

class TaskViewController: MainPageTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // This query should pull from the regular PFQuery
    override func queryForTable() -> PFQuery {
        var query:PFQuery = PFQuery(className:self.parseClassName!)
        if(objects?.count == 0) {
            query.cachePolicy = PFCachePolicy.CacheThenNetwork
        }
        query.orderByAscending("completed")
        return query
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cellIdentifier:String = "Cell"
        
        var cell:MainPageTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? MainPageTableViewCell
        
        if(cell == nil) {
            cell = NSBundle.mainBundle().loadNibNamed("MainPageTableViewCell", owner: self, options: nil)[0] as? MainPageTableViewCell
        }
        
        if let pfObject = object {
            // Set Cell's items here
            //let query = PFUser.query()?.whereKey("username", equalTo: taskAvatar!)
            //var otheruser : PFUser = query?.getFirstObject() as! PFUser
            
            var user : PFUser = pfObject["towho"] as! PFUser
            cell?.username?.text = user.username
            var t = String(stringInterpolationSegment: pfObject["value"]!)
            cell?.money.text = t
            
            let finalImage = pfObject["avatar"] as? PFFile
            /*finalImage!.getDataInBackgroundWithBlock {
                (imageData: NSData?, error: NSError?) -> Void in
                if error == nil {
                    if let imageData = imageData {
                        cell?.avatar?.image = UIImage(data:imageData)
                    }
                }
            }*/
        }
        
        return cell
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
