//
//  MainPageTableViewController.swift
//  DevelopHerHack
//
//  Created by Da Y Mun on 8/28/15.
//  Copyright (c) 2015 danamun. All rights reserved.
//

import UIKit

class MainPageTableViewController: PFQueryTableViewController {
    var currentUser = PFUser.currentUser()
    
    override init(style: UITableViewStyle, className: String?) {
        super.init(style: style, className: className)
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        self.objectsPerPage = 25
        self.parseClassName = className
    }
    
    required init(coder aDecoder:NSCoder) {
        fatalError("NSCoding not supported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func queryForTable() -> PFQuery {
        var query : PFQuery = PFUser.query()!
        if(objects?.count == 0) {
            query.cachePolicy = PFCachePolicy.CacheThenNetwork
        }

        // Later change this query to take in from the current user's family array.
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
            cell?.username?.text = pfObject["username"] as? String
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return 1
    }

    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 90
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerCell:CustomHeaderCell? = tableView.dequeueReusableHeaderFooterViewWithIdentifier("CustomHeaderCell") as? CustomHeaderCell
        
        if(headerCell == nil) {
            headerCell = NSBundle.mainBundle().loadNibNamed("CustomHeaderCell", owner: self, options: nil)[0] as? CustomHeaderCell
        }
        
        //headerCell!.frame = CGRectMake(0, 15, self.view.frame.width, 100)
        headerCell!.username.text = self.currentUser?.username

        
        var query = PFUser.query()!
        query.whereKey("username", equalTo: self.currentUser!.username!)
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        var temp: Int = (object.valueForKey("money") as? Int)!
                        headerCell!.money.text = "$\(temp)"
                    }
                }
            } else {
                // Log details of the failure
                println("Error: \(error!) \(error!.userInfo!)")
            }
        }
        return headerCell
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
