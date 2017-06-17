//
//  HotlineData.swift
//  CAC Covina App
//
//  Created by Ed Carroll on 12/9/16.
//  Copyright © 2016 Ed Carroll. All rights reserved.
//

import Foundation

struct HotlineData {
    // dict of states with hotlines
    static let stateInfosPhoneDict = ["Alabama": "(334) 242-9500", "Alaska": "(800) 478-4444",
                                      "Arizona": "(888) 767-2445", "Arkansas": "(800) 482-5964",
                                      "Colorado": "(844) 264-5437", "Connecticut": "(800) 842-2288",
                                      "Delaware": "(800) 292-9582", "District of Columbia": "(202) 671-7233",
                                      "Florida": "(800) 962-2873", "Georgia": "(855) 422-4453",
                                      "Hawaii": "(808) 832-5300", "Idaho": "(855) 552-5437",
                                      "Illinois": "(800) 252-2873", "Indiana": "(800) 800-5556",
                                      "Iowa": "(800) 362-2178", "Kansas": "(800) 922-5330",
                                      "Kentucky": "(800) 752-6200", "Louisiana": "(855) 452-5437",
                                      "Maine": "(800) 452-1999", "Massachusetts": "(800) 792-5200",
                                      "Michigan": "(800) 942-4357", "Mississippi": "(800) 222-8000",
                                      "Missouri": "(800) 392-3738", "Montana": "(866) 820-5437",
                                      "Nebraska": "(800) 652-1999", "Nevada": "(800) 992-5757",
                                      "New Hampshire": "(800) 894-5533", "New Jersey": "(877) 652-2873",
                                      "New Mexico": "(800) 797-3260", "New York": "(800) 342-3720",
                                      "Ohio": "(855) 642-4453", "Oklahoma": "(800) 522-3511",
                                      "Oregon": "(855) 503-7233", "Pennsylvania": "(800) 932-0313",
                                      "Puerto Rico": "(800) 981-8333", "Rhode Island": "(800) 742-4453",
                                      "South Dakota": "(877) 244-0864", "Tennessee": "(877) 237-0004",
                                      "Texas": "(800) 252-5400", "Utah": "(800) 678-9399",
                                      "Vermont": "(800) 649-5285", "Virginia": "(800) 552-7096",
                                      "Washington": "(866) 363-4276", "West Virginia": "(800) 352-6513",
                                      "Wyoming": "(307) 777-5536"]
    // dict of states with urls to hotline lists
    // value for California not needed, but key is needed for stateNames
    static let stateInfosWebDict = ["California": "",
                                    "Maryland": "http://dhr.maryland.gov/child-protective-services/reporting-suspected-child-abuse-or-neglect/local-offices/",
                                    "Minnesota": "http://mn.gov/dhs/people-we-serve/children-and-families/services/child-protection/contact-us/index.jsp",
                                    "North Carolina": "http://www2.ncdhhs.gov/dss/local/docs/directory.pdf",
                                    "North Dakota": "http://www.nd.gov/dhs/locations/countysocialserv/index.html",
                                    "South Carolina": "https://dss.sc.gov/contact/",
                                    "Wisconsin": "http://dcf.wi.gov/reportabuse"]
    
    // used to populate state picker
    static let stateNames = (Array(stateInfosPhoneDict.keys) + Array(stateInfosWebDict.keys)).sorted()
    
    // dict of California counties with hotlines
    static let countyDict = ["Alameda": "(510) 259-1800", "Alpine": "(530) 694-2235", "Amador": "(209) 223-6550",
                             "Butte": "(800) 400-0902", "Calaveras": "(209) 754-6452", "Colusa": "(530) 458-0280",
                             "Contra Costa": "(877) 881-1116", "Del Norte": "(707) 464-3191", "El Dorado": "(530) 642-7100",
                             "Fresno": "(559) 255-8320", "Glenn": "(530) 934-6520", "Humboldt": "(707) 445-6180",
                             "Imperial": "(760) 337-7750", "Inyo": "(760) 872-1727", "Kern": "(661) 631-6011",
                             "Kings": "(559) 582-2352", "Lake": "(707) 262-0235", "Lassen": "(530) 251-8277",
                             "Los Angeles": "(800) 540-4000", "Madera": "(559) 675-7829", "Marin": "(415) 499-7153",
                             "Mariposa": "(209) 966-7000", "Mendocino": "(866) 236-0368", "Merced": "(209) 385-3104",
                             "Modoc": "(530) 233-6602", "Mono": "(760) 932-7755", "Monterey": "(831) 755-4661",
                             "Napa": "(707) 253-4262", "Nevada": "(530) 273-4291", "Orange": "(714) 940-1000",
                             "Placer": "(916) 872-6549", "Plumas": "(800) 242-3338", "Riverside": "(800) 442-4918",
                             "Sacramento": "(916) 875-5437", "San Benito": "(831) 636-4190", "San Bernadino": "(909) 384-9233",
                             "San Diego": "(858) 560-2191", "San Francisco": "(415) 558-2650", "San Joaquin": "(209) 468-1333",
                             "San Luis Obispo": "(805) 781-5437", "San Mateo": "(650) 595-7922", "Santa Barbara": "(800) 367-0166",
                             "Santa Clara": "(408) 299-2071", "Santa Cruz": "(831) 454-2273", "Shasta": "(530) 225-5144",
                             "Sierra": "(530) 289-3720", "Siskiyou": "(530) 841-4200", "Solano": "(800) 544-8696",
                             "Sonoma": "(707) 565-4304", "Stanislaus": "(209) 558-3665", "Sutter": "(530) 822-7227",
                             "Tehema": "(530) 527-1911", "Trinity": "(530) 623-1314", "Tulare": "(559) 730-2677",
                             "Tuolumne": "(209) 533-5717", "Ventura": "(805) 654-3200", "Yolo": "(530) 669-2345",
                             "Yuba": "(530) 749-6288"]
    
    // used to populate California county picker
    static let countyNames = Array(countyDict.keys).sorted()
}

