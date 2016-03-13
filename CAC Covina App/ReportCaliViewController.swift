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
        
        // Initial dial number + selection set for Tennessee

        callButton.setTitle("(800) 540-4000", forState: UIControlState.Normal)
        countyPicker.selectRow(18, inComponent: 0, animated: true)
    }
    
    //MARK: Arrays
    // array of county names and numbers
    var countyNames = ["Alameda","Alpine","Amador","Butte","Calaveras","Colusa","Contra Costa",
        "Del Norte","El Dorado","Fresno","Glenn","Humboldt","Imperial","Inyo",
        "Kern","Kings","Lake","Lassen","Los Angeles","Madera","Marin","Mariposa",
        "Mendocino","Merced","Modoc","Mono","Monterey","Napa","Nevada","Orange",
        "Placer","Plumas","Riverside","Sacramento","San Benito","San Bernadino",
        "San Diego","San Francisco","San Joaquin","San Luis Obispo","San Mateo",
        "Santa Barbara","Santa Clara","Santa Cruz","Shasta","Sierra","Siskiyou",
        "Solano","Sonoma","Stanislaus","Sutter","Tehema","Trinity","Tulare",
        "Tuolumne","Ventura","Yolo","Yuba"]
    
    var countyNums = ["(510) 259-1800","(530) 694-2235","(209) 223-6550","(800) 400-0902",
        "(209) 754-6452","(530) 458-0280","(877) 881-1116","(707) 464-3191",
        "(530) 642-7100","(559) 255-8320","(530) 934-6520","(707) 445-6180",
        "(760) 337-7750","(760) 872-1727","(661) 631-6011","(559) 582-2352",
        "(707) 262-0235","(530) 251-8277","(800) 540-4000","(559) 675-7829",
        "(415) 499-7153","(209) 966-7000","(866) 236-0368","(209) 385-3104",
        "(530) 233-6602","(760) 932-7755","(831) 755-4661","(707) 253-4262",
        "(530) 273-4291","(714) 940-1000","(916) 872-6549","(800) 242-3338",
        "(800) 442-4918","(916) 875-5437","(831) 636-4190","(909) 384-9233",
        "(858) 560-2191","(415) 558-2650","(209) 468-1333","(805) 781-5437",
        "(650) 595-7922","(800) 367-0166","(408) 299-2071","(831) 454-2273",
        "(530) 225-5144","(530) 289-3720","(530) 841-4200","(800) 544-8696",
        "(707) 565-4304","(209) 558-3665","(530) 822-7227","(530) 527-1911",
        "(530) 623-1314","(559) 730-2677","(209) 533-5717","(805) 654-3200",
        "(530) 669-2345","(530) 749-6288"]
    
    //MARK: Picker Functions
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countyNames.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countyNames[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let itemSelected = countyNames[row]
        
        for var i = 1; i < countyNames.count; i++ {
            if itemSelected == countyNames[i] {
                callButton.setTitle(countyNums[i], forState:  UIControlState.Normal)
            }
        }
    }
    
    //MARK: Actions
    @IBAction func callButton(sender: AnyObject) {
        
        // removes special characters from string
        let charSet = NSCharacterSet(charactersInString: "1234567890").invertedSet
        let unformatted = callButton.currentTitle
        let cleanedString = unformatted!.componentsSeparatedByCharactersInSet(charSet).joinWithSeparator("")
        
        
        // create and configure alert controller
        let alertController = UIAlertController(title: unformatted, message: "", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
        }
        alertController.addAction(cancelAction)
        
        let CallAction = UIAlertAction(title: "Call", style: .Default) { (action) in
            UIApplication.sharedApplication().openURL(NSURL(string: "tel://" + cleanedString)!)
        }
        alertController.addAction(CallAction)
        
        self.presentViewController(alertController, animated: true) {
        }
    }
}