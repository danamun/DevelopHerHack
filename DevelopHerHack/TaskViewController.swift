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
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        
        var cell : MainPageTableViewCell = tableView.cellForRowAtIndexPath(indexPath) as! MainPageTableViewCell
        
        var completeButton:UITableViewRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Complete") { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            
            //Send parse info on the Complete
            var var1: Float = NSString(string: cell.money.text!).floatValue
            var var2: Float = self.currentUser?["money"]! as! Float
            self.currentUser?["money"] =  var1 + var2
            self.currentUser?.saveInBackgroundWithBlock{
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    // The object has been saved.
                } else {
                    // There was a problem, check error.description
                }
            }
            
            var query : PFQuery = PFQuery(className: self.parseClassName!)
            query.getObjectWithId(cell.cellID)
            var deleteCell: PFObject = query.getFirstObject()!
            deleteCell.deleteInBackground()
            println("Click Complete!")
            
        };
        completeButton.backgroundColor = LIGHTERORANGE
        
        var declineButton: UITableViewRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Decline") { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            
            //Send parse info on the Decline
            var query : PFQuery = PFQuery(className: self.parseClassName!)
            query.getObjectWithId(cell.cellID)
            var deleteCell: PFObject = query.getFirstObject()!
            deleteCell.deleteInBackground()
            println("Click Decline")
            
        };
        declineButton.backgroundColor = DARKERBLUE
        return [completeButton, declineButton];
        
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return self.editable
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cellIdentifier:String = "Cell"
        
        var cell:MainPageTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? MainPageTableViewCell
        
        if(cell == nil) {
            cell = NSBundle.mainBundle().loadNibNamed("MainPageTableViewCell", owner: self, options: nil)[0] as? MainPageTableViewCell
        }
        
        if let pfObject = object {
            cell?.cellID = pfObject.objectId
            cell?.username?.text = pfObject["towho"]!.username
            if (cell?.username?.text == self.currentUser?.username) {
                self.editable = true
            } else {
                self.editable = false
            }
            var t = String(stringInterpolationSegment: pfObject["value"]!)
            cell?.money.text = t
            
            let finalImage = pfObject["towho"]!.valueForKey("avatar") as? PFFile
            finalImage!.getDataInBackgroundWithBlock {
                (imageData: NSData?, error: NSError?) -> Void in
                if error == nil {
                    if let imageData = imageData {
                        cell?.avatar?.image = UIImage(data:imageData)
                    }
                }
            }
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
