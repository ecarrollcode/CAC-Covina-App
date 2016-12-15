//
//  ReportViewController.swift
//  CAC Covina App
//
//  Created by Ed Carroll on 1/14/16.
//  Copyright © 2016 Ed Carroll. All rights reserved.
//

import UIKit
import Foundation

class ReportViewController: UIViewController, UIPickerViewDelegate {

    //MARK: Outlets
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var callOrUrlButton: UIButton!

    
    //MARK: Variables
    var urlString = String()  // to be filled with hotline url
    var isCalifornia = Bool() // used to determine if California is selected
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initial dial number + selection set for California
        isCalifornia = true
        callOrUrlButton.setTitle("Select a county", forState: UIControlState.Normal)
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
            callOrUrlButton.setTitle("Select a county", forState: UIControlState.Normal)
            isCalifornia = true // used to trigger segue in callOrUrlButton action
        } else if (phoneDictValue != nil) {
            callOrUrlButton.setTitle(phoneDictValue, forState: UIControlState.Normal)
            urlString.removeAll()
        } else if (webDictValue != nil) {
            callOrUrlButton.setTitle("See hotline list", forState: UIControlState.Normal)
            urlString = webDictValue!
        }
    }

    //MARK: Actions
    @IBAction func callOrUrlButton(sender: AnyObject) {
        
        if isCalifornia {
            self.performSegueWithIdentifier("reportCaliSegue", sender: nil)
            return
        }
        
        // removes special characters from string
        let charSet = NSCharacterSet(charactersInString: "1234567890").invertedSet
        let unformatted = callOrUrlButton.currentTitle
        let cleanedString = unformatted!.componentsSeparatedByCharactersInSet(charSet).joinWithSeparator("")
        
        // create and configure alert controller
        let alertController = UIAlertController(title: unformatted, message: "", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let callAction = UIAlertAction(title: "Call", style: .Default) { (action) in
            UIApplication.sharedApplication().openURL(NSURL(string: "tel://" + cleanedString)!)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(callAction)
        
        if urlString.isEmpty {
            self.presentViewController(alertController, animated: true, completion: nil)
        } else {
            UIApplication.sharedApplication().openURL(NSURL(string: urlString)!)
        }
    }
}
