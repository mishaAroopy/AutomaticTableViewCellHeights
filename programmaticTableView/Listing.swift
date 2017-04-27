//
//  Listing.swift
//  programmaticTableView
//
//  Created by AINSLIE YUEN on 4/27/17.
//  Copyright © 2017 Aroopy. All rights reserved.
//

import UIKit

class Listing: NSObject {
    // MARK: Properties
    var jobTitle: String, jobDescription: String
    var listingDate: Date
    
    // MARK: Initialization
    init?(  jobTitle: String, jobDescription: String, listingDate: Date){
        self.jobTitle = jobTitle
        self.jobDescription = jobDescription
        self.listingDate = listingDate
        super.init()
        // Initialization should fail if some key fields are missing!
        if ((jobTitle.isEmpty) || (jobDescription.isEmpty)) {
            return nil
        }
    }
}
