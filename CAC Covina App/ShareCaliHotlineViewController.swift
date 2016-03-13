//
//  ShareCaliHotlineViewController.swift
//  CAC Covina App
//
//  Created by Ed Carroll on 1/15/16.
//  Copyright © 2016 Ed Carroll. All rights reserved.
//

import UIKit
import MessageUI
import Foundation

class ShareCaliHotlineViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    //MARK: Outlets
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var sendHotline: UIButton!
    
    
    //MARK: Variables
    // intialize empty string to be filled with numbers
    var messageText = ""
    
    // initialize variable to access variables in ReportCaliViewController
    var reportCaliViewController = ReportCaliViewController()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageText = "Call this number to report child abuse in Los Angeles county: (800) 540-4000"
        sendHotline.setTitle("Send hotline", forState: UIControlState.Normal)
        statePicker.selectRow(18, inComponent: 0, animated: true)
    }
    
    //MARK: Picker Functions
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return reportCaliViewController.countyNames.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return reportCaliViewController.countyNames[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let itemSelected = reportCaliViewController.countyNames[row]
        
        for (var i = 1; i < reportCaliViewController.countyNames.count; i++) {
            if itemSelected == reportCaliViewController.countyNames[i] {
                sendHotline.setTitle("Send hotline", forState:  UIControlState.Normal)
                messageText = "Call this number to report child abuse in " + reportCaliViewController.countyNames[i]
                    + " county: " + reportCaliViewController.countyNums[i];
            }
        }
    }
    
    //MARK: Actions
    @IBAction func sendHotline(sender: AnyObject) {
        
        if MFMessageComposeViewController.canSendText() == false {
            print("Cannot send text")
            return
        }
        
        let messageVC = MFMessageComposeViewController()
        
        messageVC.body = messageText;
        messageVC.recipients = [" "];
        messageVC.messageComposeDelegate = self;
        
        self.presentViewController(messageVC, animated: false, completion: nil)
    }
    
    //MARK: SMS Message Functions
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        switch (result.rawValue) {
        case MessageComposeResultCancelled.rawValue:
            print("Message was cancelled")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultFailed.rawValue:
            print("Message failed")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultSent.rawValue:
            print("Message was sent")
            self.dismissViewControllerAnimated(true, completion: nil)
        default:
            break;
        }
    }
    
    
}