//
//  HomeViewController.swift
//  CAC Covina App
//
//  Created by Ed Carroll on 1/14/16.
//  Copyright © 2016 Ed Carroll. All rights reserved.
//

import Foundation
import UIKit
import MessageUI


class HomeViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var linkToYoutube: UIButton!
    @IBOutlet weak var linkToWebsite: UIButton!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Actions
    @IBAction func linkToYoutube(sender: AnyObject) {
        // link to YouTube channel
        UIApplication.sharedApplication().openURL(NSURL(string: "https://www.youtube.com/channel/UCyLMpGZaNlrtdBnwp4kGSCQ")!)
    }
    
    
    @IBAction func linkToWebsite(sender: AnyObject) {
        // link to website
        UIApplication.sharedApplication().openURL(NSURL(string: "http://childrensadvocacyctr.org/services")!)
    }
}
