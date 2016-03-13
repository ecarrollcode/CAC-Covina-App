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

    
    //MARK: Variables and Arrays
    // intialize empty string to be filled with url
    var urlString = ""
    
    // initialize bool to determine if California is selcted
    var isCalifornia = false;
    
    // array of state names for picker
    var stateNames = ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware",
        "District of Columbia","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa",
        "Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota",
        "Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey",
        "New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon",
        "Pennsylvania","Puerto Rico","Rhode Island","South Carolina","South Dakota","Tennessee",
        "Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initial dial number + selection set for California
        // set value of isCalifornia
        isCalifornia = true;
        callOrUrlButton.setTitle("Select a county", forState: UIControlState.Normal)
        statePicker.selectRow(4, inComponent: 0, animated: true)
    }
    
    //MARK: Picker Functions
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stateNames.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stateNames[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let itemSelected = stateNames[row]
        
        // list of states + their phone numbers
        let alabama = (name: "Alabama", info: "(334) 242-9500")
        let alaska = (name: "Alaska", info: "(800) 478-4444")
        let arizona = (name: "Arizona", info: "(888) 767-2445")
        let arkansas = (name: "Arkansas", info: "(800) 482-5964")
        let colorado = (name: "Colorado", info: "(844) 264-5437")
        let connecticut = (name: "Connecticut", info: "(800) 842-2288")
        let delaware = (name: "Delaware", info: "(800) 292-9582")
        let dc = (name: "District of Columbia", info: "(202) 671-7233")
        let florida = (name: "Florida", info: "(800) 962-2873")
        let georgia = (name: "Georgia", info: "(855) 422-4453")
        let hawaii = (name: "Hawaii", info: "(808) 832-5300")
        let idaho = (name: "Idaho", info: "(855) 552-5437")
        let illinois = (name: "Illinois", info: "(800) 252-2873")
        let indiania = (name: "Indiana", info: "(800) 800-5556")
        let iowa = (name: "Iowa", info: "(800) 362-2178")
        let kansas = (name: "Kansas", info: "(800) 922-5330")
        let kentucky = (name: "Kentucky", info: "(800) 752-6200")
        let louisiana = (name: "Louisiana", info: "(855) 452-5437")
        let maine = (name: "Maine", info: "(800) 452-1999")
        let massachusetts = (name: "Massachusetts", info: "(800) 792-5200")
        let michigan = (name: "Michigan", info: "(800) 942-4357")
        let mississippi = (name: "Mississippi", info: "(800) 222-8000")
        let missouri = (name: "Missouri", info: "(800) 392-3738")
        let montana = (name: "Montana", info: "(866) 820-5437")
        let nebraska = (name: "Nebraska", info: "(800) 652-1999")
        let nevada = (name: "Nevada", info: "(800) 992-5757")
        let newHampshire = (name: "New Hampshire", info: "(800) 894-5533")
        let newJersey = (name: "New Jersey", info: "(877) 652-2873")
        let newMexico = (name: "New Mexico", info: "(800) 797-3260")
        let newYork = (name: "New York", info: "(800) 342-3720")
        let ohio = (name: "Ohio", info: "(855) 642-4453")
        let oklahoma = (name: "Oklahoma", info: "(800) 522-3511")
        let oregon = (name: "Oregon", info: "(855) 503-7233")
        let pennsylvania = (name: "Pennsylvania", info: "(800) 932-0313")
        let puertoRico = (name: "Puerto Rico", info: "(800) 981-8333")
        let rhodeIsland = (name: "Rhode Island", info: "(800) 742-4453")
        let southDakota = (name: "South Dakota", info: "(877) 244-0864")
        let tennessee = (name: "Tennessee", info: "(877) 237-0004")
        let texas = (name: "Texas", info: "(800) 252-5400")
        let utah = (name: "Utah", info: "(800) 678-9399")
        let vermont = (name: "Vermont", info: "(800) 649-5285")
        let virginia = (name: "Virginia", info: "(800) 552-7096")
        let washington = (name: "Washington", info: "(866) 363-4276")
        let westVirginia = (name: "West Virginia", info: "(800) 352-6513")
        let wyoming = (name: "Wyoming", info: "(307) 777-5536")
        
        // states + urls
        let maryland = (name: "Maryland", info: "http://www.dhr.state.md.us/blog/?page_id=4631")
        let minnesota = (name: "Minnesota", info: "http://mn.gov/dhs/people-we-serve/children-and-families/services/child-protection/contact-us/index.jsp")
        let northCarolina = (name: "North Carolina", info: "http://www2.ncdhhs.gov/dss/local/docs/directory.pdf")
        let northDakota = (name: "North Dakota", info: "http://www.nd.gov/dhs/locations/countysocialserv/index.html")
        let southCarolina = (name: "South Carolina", info: "https://dss.sc.gov/content/about/counties/index.aspx")
        let wisconsin = (name: "Wisconsin", info: "http://dcf.wi.gov/children/CPS/cpswimap.htm?ref=hp")
        
        // array of phone numbers to be iterated over in for loop
        let stateInfosPhone = [alabama, alaska, arizona, arkansas, colorado, connecticut, delaware, dc, florida, georgia, hawaii,
            idaho, illinois, indiania, iowa, kansas, kentucky, louisiana, maine, massachusetts, michigan, mississippi,
            missouri, montana, nebraska, nevada, newHampshire, newJersey, newMexico, newYork, ohio, oklahoma, oregon,
            pennsylvania, puertoRico, rhodeIsland, southDakota, tennessee, texas, utah, vermont, virginia,
            washington, westVirginia, wyoming]
        
        
        // array of urls
        let stateInfosWeb = [maryland, minnesota, northCarolina, northDakota,
            southCarolina, wisconsin]
        
        isCalifornia = false;
        
        // iterates over both arrays
        for i in stateInfosPhone {
            for j in stateInfosWeb {
                if itemSelected == j.name {
                    callOrUrlButton.setTitle("See hotline list", forState: UIControlState.Normal)
                    urlString = j.info
                }
            }
            if itemSelected == i.name {
                callOrUrlButton.setTitle(i.info, forState: UIControlState.Normal)
                urlString = ""
            }
        }
        
        if itemSelected == "California" {
            callOrUrlButton.setTitle("Select a county", forState: UIControlState.Normal)
            isCalifornia = true;
        }
    }

    //MARK: Actions
    @IBAction func callOrUrlButton(sender: AnyObject) {
        
        if isCalifornia == true {
            self.performSegueWithIdentifier("reportCaliSegue", sender: nil)
            return
        }
        
        // removes special characters from string
        let charSet = NSCharacterSet(charactersInString: "1234567890").invertedSet
        let unformatted = callOrUrlButton.currentTitle
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
        
        
        if urlString.isEmpty == true {
            self.presentViewController(alertController, animated: true) {
            }
        } else {
            UIApplication.sharedApplication().openURL(NSURL(string: urlString)!)
        }
    }
}
