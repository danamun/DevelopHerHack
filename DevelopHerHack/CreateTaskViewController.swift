//
//  CreateTaskViewController.swift
//  DevelopHerHack
//
//  Created by Da Y Mun on 8/29/15.
//  Copyright (c) 2015 danamun. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController,  UIPageViewControllerDataSource {
    // Items for the page view controller
    var pageVC : UIPageViewController!
    var index : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting up the Page View Controller
        var pageController = UIPageControl.appearance()
        pageController.pageIndicatorTintColor = UIColor.lightGrayColor()
        pageController.currentPageIndicatorTintColor = UIColor.blackColor()
        pageController.backgroundColor = UIColor.whiteColor()
        
        self.pageVC = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
        self.pageVC.dataSource = self
        
        var avatarVC = self.viewControllerAtIndex(0) as! AvatarViewController
        var viewControllers = NSArray(object: avatarVC)
        self.pageVC.setViewControllers(viewControllers as [AnyObject], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        self.pageVC.view.frame = self.view.frame
        //self.pageVC.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        self.addChildViewController(self.pageVC)
        self.view.addSubview(self.pageVC.view)
        self.pageVC.didMoveToParentViewController(self)
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
    
    func viewControllerAtIndex(index: Int) -> UIViewController? {
        if (index >= 4) {
            return AvatarViewController()
        }
        var avatarVC = AvatarViewController(nibName: "AvatarViewController", bundle: nil)
        var descriptionVC = DescriptionViewController(nibName: "DescriptionViewController", bundle: nil)
        var moneyVC = MoneyViewController(nibName: "MoneyViewController", bundle: nil)
        var summaryVC = SummaryViewController(nibName: "SummaryViewController", bundle: nil)
        
        switch(index) {
        case 0:
            return avatarVC
        case 1:
            return descriptionVC
        case 2:
            return moneyVC
        case 3:
            return summaryVC
        default:
            return AvatarViewController()
        }
    }
    
    // MARK: - Page View Controller Data Source
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if (self.index == 0 || self.index == NSNotFound) {
            return nil
        } else {
            self.index--
            return self.viewControllerAtIndex(self.index)
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if (self.index == NSNotFound) {
            return nil
        }
        index++
        if (index == 4) {
            index--
            return nil
        }
        return self.viewControllerAtIndex(self.index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 4
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }


}
