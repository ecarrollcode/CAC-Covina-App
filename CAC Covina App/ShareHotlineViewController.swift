//
//  ShareHotlineViewController.swift
//  CAC Covina App
//
//  Created by Ed Carroll on 1/14/16.
//  Copyright © 2016 Ed Carroll. All rights reserved.
//

import UIKit
import MessageUI
import Foundation

class ShareHotlineViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    //MARK: Outlets
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var sendHotline: UIButton!

    
    //MARK: Variables
    // initialize variable to determine if California is selected
    var isCalifornia = Bool()
    
    // intialize empty string to be filled with url
    var numOrUrlString = String()
    var messageText = String()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        messageText.removeAll()
        // set picker deafault to California configurations
        isCalifornia = true
        sendHotline.setTitle("Select a county", forState: UIControlState.Normal)
        statePicker.selectRow(4, inComponent: 0, animated: true)
    }
    
    //MARK: Picker Functions
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return HotlineData.stateNames.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return HotlineData.stateNames[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let itemSelected = HotlineData.stateNames[row]
        let phoneDictValue = HotlineData.stateInfosPhoneDict[itemSelected]
        let webDictValue = HotlineData.stateInfosWebDict[itemSelected]
        
        isCalifornia = false // assume California is not selected
        if (itemSelected == "California") {
            sendHotline.setTitle("Select a county", forState: UIControlState.Normal)
            isCalifornia = true // used to trigger segue in sendHotline action
        } else if (phoneDictValue != nil) {
            // accounts for special cases of DC and Puerto Rico
            if (itemSelected == "District of Columbia") {
                messageText = "Call this number to report child abuse in the " + itemSelected + ": " + phoneDictValue!;
                sendHotline.setTitle("Send hotline number", forState: UIControlState.Normal)
            } else if (itemSelected == "Puerto Rico") {
                messageText = "Call this number to report child abuse in " + itemSelected + ": " + phoneDictValue!;
                sendHotline.setTitle("Send hotline number", forState: UIControlState.Normal)
            } else {
                messageText = "Call this number to report child abuse in the state of " + itemSelected + ": " + phoneDictValue!;
                sendHotline.setTitle("Send hotline number", forState: UIControlState.Normal)
            }
        } else if (webDictValue != nil) {
            messageText = "Follow this link for a list of hotlines to report child abuse in the state of " + itemSelected + ": " + webDictValue!;
            sendHotline.setTitle("Send hotline list", forState: UIControlState.Normal)
        }
    }
    
    //MARK: Actions
    @IBAction func sendHotline(sender: AnyObject) {
        
        if isCalifornia {
            self.performSegueWithIdentifier("shareCaliSegue", sender: nil)
            return
        }
        
        if MFMessageComposeViewController.canSendText() == false {
            print("Cannot send text")
            return
        }
        
        let messageVC = MFMessageComposeViewController()
        
        messageVC.body = messageText
        messageVC.recipients = [" "]
        messageVC.messageComposeDelegate = self
        
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
