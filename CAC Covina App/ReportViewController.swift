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
        callOrUrlButton.setTitle("Select a county", for: UIControlState())
        statePicker.selectRow(4, inComponent: 0, animated: true)
    }
    
    //MARK: Picker Functions
    func numberOfComponentsInPickerView(_ pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return HotlineData.stateNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return HotlineData.stateNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let itemSelected = HotlineData.stateNames[row]
        let phoneDictValue = HotlineData.stateInfosPhoneDict[itemSelected]
        let webDictValue = HotlineData.stateInfosWebDict[itemSelected]
        
        isCalifornia = false // assume California is not selected
        if (itemSelected == "California") {
            callOrUrlButton.setTitle("Select a county", for: UIControlState())
            isCalifornia = true // used to trigger segue in callOrUrlButton action
        } else if (phoneDictValue != nil) {
            callOrUrlButton.setTitle(phoneDictValue, for: UIControlState())
            urlString.removeAll()
        } else if (webDictValue != nil) {
            callOrUrlButton.setTitle("See hotline list", for: UIControlState())
            urlString = webDictValue!
        }
    }

    //MARK: Actions
    @IBAction func callOrUrlButton(_ sender: Any) {
        
        if isCalifornia {
            self.performSegue(withIdentifier: "reportCaliSegue", sender: nil)
            return
        }
        
        // removes special characters from string
        let charSet = CharacterSet(charactersIn: "1234567890").inverted
        let unformatted = callOrUrlButton.currentTitle
        let cleanedString = unformatted!.components(separatedBy: charSet).joined(separator: "")
        let number = URL(string: "tel://" + cleanedString)
        
        if !urlString.isEmpty {
            let url = NSURL(string: self.urlString)! as URL
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(number!)
            } else {
                UIApplication.shared.openURL(number!)
            }
        }
    }
}
