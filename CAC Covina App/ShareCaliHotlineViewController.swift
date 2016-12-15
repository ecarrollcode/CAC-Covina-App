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
    var messageText = String()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageText = "Call this number to report child abuse in Los Angeles county: " + HotlineData.countyDict["Los Angeles"]!
        sendHotline.setTitle("Send hotline number", forState: UIControlState.Normal)
        statePicker.selectRow(18, inComponent: 0, animated: true)
    }
    
    //MARK: Picker Functions
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return HotlineData.countyNames.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return HotlineData.countyNames[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let itemSelected = HotlineData.countyNames[row]
        let countyDictValue = HotlineData.countyDict[itemSelected]
        
        sendHotline.setTitle("Send hotline number", forState:  UIControlState.Normal)
        messageText = "Call this number to report child abuse in " + itemSelected +
                      " county: " + countyDictValue!
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
