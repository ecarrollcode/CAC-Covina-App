//
//  ShareViewController.swift
//  CAC Covina App
//
//  Created by Ed Carroll on 1/14/16.
//  Copyright © 2016 Ed Carroll. All rights reserved.
//

import UIKit
import MessageUI
import Foundation

class ShareViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    //MARK: Outlets
    @IBOutlet weak var shareApp: UIButton!
    
    
    //MARK: Actions
    // add sms functionality to share app
    @IBAction func shareApp(sender: AnyObject) {
        if MFMessageComposeViewController.canSendText() == false {
            print("Cannot send text")
            return
        }
        
        let messageVC = MFMessageComposeViewController()
        
        messageVC.body = "Help fight child abuse. " +
                         "Learn, Report, Support and Share by downloading the Children's Advocacy Center app: " +
                         "https://itunes.apple.com/us/app/childrens-advocacy-center/id1075992273?mt=8";
        messageVC.recipients = [" "];
        messageVC.messageComposeDelegate = self;
        
        self.presentViewController(messageVC, animated: false, completion: nil)
    }
    
    //MARK: SMS Message Functions
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        switch (result) {
        case .Cancelled:
            print("Message was cancelled")
            self.dismissViewControllerAnimated(true, completion: nil)
        case .Failed:
            print("Message failed")
            self.dismissViewControllerAnimated(true, completion: nil)
        case .Sent:
            print("Message was sent")
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
