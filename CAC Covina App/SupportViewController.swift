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
    @IBAction func twitButton(_ sender: Any) {
        let twitURL = "twitter://user?screen_name=CACPomona"
        let normURL = "https://twitter.com/CACPomona"
        
        // checks if Twitter app is installed, and if it is not, opens url in Safari
        if UIApplication.shared.canOpenURL(URL(string: twitURL)!) {
            UIApplication.shared.openURL(URL(string: twitURL)!)
        } else {
            UIApplication.shared.openURL(URL(string: normURL)!)
        }
    }
    
    @IBAction func fbButton(_ sender: Any) {
        let fbURL = "fb://profile/101812303303312"
        let normURL = "https://www.facebook.com/CACCovina/"
        
        // checks if Facebook app is installed, and if it is not, opens url in Safari
        if UIApplication.shared.canOpenURL(URL(string: fbURL)!) {
            UIApplication.shared.openURL(URL(string: fbURL)!)
        } else {
            UIApplication.shared.openURL(URL(string: normURL)!)
        }
    }
    
    @IBAction func donateButton(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "http://childrensadvocacyctr.org/donate")!)
    }
    
    @IBAction func volButton(_ sender: Any) {
        
        let number = URL(string: "tel://6263316700")
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number!)
        } else {
            UIApplication.shared.openURL(number!)
        }
    }
}
