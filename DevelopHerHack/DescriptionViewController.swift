//
//  DescriptionViewController.swift
//  DevelopHerHack
//
//  Created by Da Y Mun on 8/29/15.
//  Copyright (c) 2015 danamun. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var newTitle: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    var placeholderText = "description of task"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        descriptionTextView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func editedTitle(sender: AnyObject) {
        taskTitle = newTitle.text
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - UITextViewDelegate
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        print("went here")
        if(textView.text == self.placeholderText) {
            self.descriptionTextView.text = ""
        }
        
        return true
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if(textView.text == "") {
            self.descriptionTextView.text = self.placeholderText
        }
        
        taskDescription = self.descriptionTextView.text
    }

}
