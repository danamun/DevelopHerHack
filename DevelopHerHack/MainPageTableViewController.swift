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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func queryForTable() -> PFQuery {
        //var query:PFQuery = PFQuery(className:self.parseClassName!)
        var query : PFQuery = PFUser.query()!
        if(objects?.count == 0)
        {
            query.cachePolicy = PFCachePolicy.CacheThenNetwork
        }

        //query.whereKey("familyArray", equalTo: currentUser!.username!)
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
