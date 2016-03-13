//
//  SupportViewController.swift
//  CAC Covina App
//
//  Created by Ed Carroll on 1/15/16.
//  Copyright © 2016 Ed Carroll. All rights reserved.
//

import UIKit
import MessageUI
import Foundation

class SupportViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var twitButton: UIButton!
    @IBOutlet weak var fbButton: UIButton!
    @IBOutlet weak var donateButton: UIButton!
    @IBOutlet weak var volButton: UIButton!
    
    
    //MARK: Actions
    @IBAction func twitButton(sender: AnyObject) {
        let twitURL = "twitter://user?screen_name=CACPomona"
        let normURL = "https://twitter.com/CACPomona"
        
        // checks if Twitter app is installed, and if it is not, opens url in Safari
        if UIApplication.sharedApplication().canOpenURL(NSURL(string: twitURL)!) {
            UIApplication.sharedApplication().openURL(NSURL(string: twitURL)!)
        } else {
            UIApplication.sharedApplication().openURL(NSURL(string: normURL)!)
        }
    }
    
    @IBAction func fbButton(sender: AnyObject) {
        let fbURL = "fb://profile/101812303303312"
        let normURL = "https://www.facebook.com/CACPomona"
        
        // checks if Facebook app is installed, and if it is not, opens url in Safari
        if UIApplication.sharedApplication().canOpenURL(NSURL(string: fbURL)!) {
            UIApplication.sharedApplication().openURL(NSURL(string: fbURL)!)
        } else {
            UIApplication.sharedApplication().openURL(NSURL(string: normURL)!)
        }
    }
    
    @IBAction func donateButton(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://childrensadvocacyctr.org/donate")!)
    }
    
    @IBAction func volButton(sender: AnyObject) {
        
        // create and configure alert controller
        let alertController = UIAlertController(title: "(626) 331-6700", message: "", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
        }
        alertController.addAction(cancelAction)
        
        let CallAction = UIAlertAction(title: "Call", style: .Default) { (action) in
            UIApplication.sharedApplication().openURL(NSURL(string: "tel://6263316700")!)
        }
        alertController.addAction(CallAction)
        
        self.presentViewController(alertController, animated: true) {
        }
    }
}
