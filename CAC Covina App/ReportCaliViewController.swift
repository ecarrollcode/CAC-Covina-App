//
//  ReportCaliViewController.swift
//  CAC Covina App
//
//  Created by Ed Carroll on 1/15/16.
//  Copyright © 2016 Ed Carroll. All rights reserved.
//

import Foundation
import UIKit
import MessageUI
import Foundation

class ReportCaliViewController: UIViewController {
    
    //MARK: Actions
    @IBOutlet weak var countyPicker: UIPickerView!
    @IBOutlet weak var callButton: UIButton!
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initial dial number + selection set for Los Angeles county
        callButton.setTitle(HotlineData.countyDict["Los Angeles"], forState: UIControlState.Normal)
        countyPicker.selectRow(18, inComponent: 0, animated: true)
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
        let countyDictValue = HotlineData.countyDict[itemSelected]!
        
        callButton.setTitle(countyDictValue, forState: UIControlState.Normal)
    }
    
    //MARK: Actions
    @IBAction func callButton(sender: AnyObject) {
        
        // removes special characters from string
        let charSet = NSCharacterSet(charactersInString: "1234567890").invertedSet
        let unformatted = callButton.currentTitle
        let cleanedString = unformatted!.componentsSeparatedByCharactersInSet(charSet).joinWithSeparator("")
        
        
        // create and configure alert controller
        let alertController = UIAlertController(title: unformatted, message: "", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let CallAction = UIAlertAction(title: "Call", style: .Default) { (action) in
            UIApplication.sharedApplication().openURL(NSURL(string: "tel://" + cleanedString)!)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(CallAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
