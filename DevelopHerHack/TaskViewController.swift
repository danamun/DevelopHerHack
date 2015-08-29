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
        
        self.view.backgroundColor = LIGHTERGRAY
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
        return query.includeKey("towho").includeKey("fromwho")
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cellIdentifier:String = "Cell"
        
        var cell:TaskTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? TaskTableViewCell
        
        if(cell == nil) {
            cell = NSBundle.mainBundle().loadNibNamed("TaskTableViewCell", owner: self, options: nil)[0] as? TaskTableViewCell
        }
        
        if let pfObject = object {
            // Set Cell's items here
            cell?.whom.text = pfObject["towho"]!.username!
            println("whom: ");
            var t = String(stringInterpolationSegment: pfObject["value"]!)
            cell?.money.text = t
            
            cell?.taskTitle.text = pfObject["title"]! as! String
            cell?.taskDescription.text = pfObject["description"]! as! String
//            let finalImage = pfObject["towho"]!.valueForKey("avatar") as? PFFile
//            finalImage!.getDataInBackgroundWithBlock {
//                (imageData: NSData?, error: NSError?) -> Void in
//                if error == nil {
//                    if let imageData = imageData {
//                        cell?.avatar?.image = UIImage(data:imageData)
//                    }
//                }
//            }
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
