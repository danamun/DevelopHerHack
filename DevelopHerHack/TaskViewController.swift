//
//  TaskViewController.swift
//  DevelopHerHack
//
//  Created by Da Y Mun on 8/29/15.
//  Copyright (c) 2015 danamun. All rights reserved.
//

import UIKit

class TaskViewController: MainPageTableViewController {
    var colorIndex = 0
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
        
        var cell : TaskTableViewCell = tableView.cellForRowAtIndexPath(indexPath) as! TaskTableViewCell
        
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
        
        var cell:TaskTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? TaskTableViewCell
        
        if(cell == nil) {
            cell = NSBundle.mainBundle().loadNibNamed("TaskTableViewCell", owner: self, options: nil)[0] as? TaskTableViewCell
        }
        
        if let pfObject = object {
            cell?.cellID = pfObject.objectId
            
            // Set Cell's items here
            cell?.whom.text = pfObject["towho"]!.username!
            if (cell?.whom.text == self.currentUser?.username) {
                self.editable = true
            } else {
                self.editable = false
            }

            var t = String(stringInterpolationSegment: pfObject["value"]!)
            cell?.money.text = t
            cell?.tabColor.backgroundColor = colorArray.objectAtIndex(self.colorIndex) as? UIColor
            self.colorIndex++
            if (self.colorIndex >= 3) {
                self.colorIndex = 0
            }
            cell?.taskTitle.text = pfObject["title"]! as! String
            cell?.taskDescription.text = pfObject["description"]! as! String
            cell?.separatorInset = UIEdgeInsetsZero
            cell?.layoutMargins = UIEdgeInsetsZero
            cell?.preservesSuperviewLayoutMargins = false
        }
        
        return cell
    }
    
    var selectedRowIndex: NSIndexPath = NSIndexPath(forRow: -1, inSection: 0)
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedRowIndex = indexPath
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == selectedRowIndex.row {
            return 150
        }
        return 90
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
