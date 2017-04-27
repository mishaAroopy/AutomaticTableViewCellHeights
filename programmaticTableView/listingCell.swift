//
//  listingCell.swift
//  programmaticTableView
//
//  Created by AINSLIE YUEN on 4/27/17.
//  Copyright © 2017 Aroopy. All rights reserved.
//

import UIKit

class listingCell: UITableViewCell {
    // MARK: Properties
    var jobTitle: UILabel!
    var jobDescription: UITextView!
    var listingDate: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //This is the initializer used by the tableView when you call its dequeueReusableCellWithIdentifier: method
    override init( style: UITableViewCellStyle, reuseIdentifier: String? ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let x_loc = 10
        let myWidth = Int(self.frame.size.width) - 2*x_loc
        var y_loc = 0
        
        var myFont = UILabel().font
        let smallFont = myFont?.withSize(12)
        let medFont = myFont?.withSize(14)
        let biggerFont = UIFont.boldSystemFont(ofSize: 16)
        
        jobTitle = UILabel(frame: CGRect(x: x_loc, y: y_loc, width: myWidth, height: 30))
        jobTitle.translatesAutoresizingMaskIntoConstraints = false
        jobTitle.font = biggerFont
        jobTitle.textColor = UIColor.blue
        jobTitle.text = "Title"
        self.contentView.addSubview(jobTitle)
        y_loc += 30
        
        listingDate = UILabel(frame: CGRect(x: x_loc, y: y_loc, width: myWidth, height: 20))
        listingDate.translatesAutoresizingMaskIntoConstraints = false
        listingDate.font = smallFont
        listingDate.text = "May 8, 2:14 AM"
        self.contentView.addSubview(listingDate)
        y_loc += 20
        
        jobDescription = UITextView(frame: CGRect(x: 0, y: y_loc, width: Int(self.frame.size.width), height: 50))
        jobDescription.translatesAutoresizingMaskIntoConstraints = false
        jobDescription.textContainer.lineFragmentPadding = 0 //this aligns textView left edge with the UILabels!
        //format textview around the other things in the cell ...
        //let path1 = UIBezierPath(rect: someImageView.frame)
        //let path2 = UIBezierPath(rect: someOtherView.frame)
        //jobDescription.textContainer.exclusionPaths = [path1,path2]
        //And make sure we constrain things properly so that there is no ambiguity.
        jobDescription.font = medFont
        jobDescription.isEditable = false
        jobDescription.isUserInteractionEnabled = false
        jobDescription.isScrollEnabled = false // If we don't use this then it outputs a shorter (but scrollable) textview!
        jobDescription.text = "This is a summary..."
        self.contentView.addSubview(jobDescription)
        //The UITableViewAutomaticDimension works with Constraints. So we need to constrain things perfectly.
        //I haven't used the more recent Anchor as they require iOS9.0 and I wanted to keep this viable for iOS8.0
        let constraintTop = NSLayoutConstraint(item: jobDescription,
                                               attribute: NSLayoutAttribute.top,
                                               relatedBy: NSLayoutRelation.equal, toItem: self.listingDate,
                                               attribute: NSLayoutAttribute.bottom, multiplier: 1,
                                               constant: 0)
        let constraintBottom = NSLayoutConstraint(item: jobDescription,
                                                  attribute: NSLayoutAttribute.bottom,
                                                  relatedBy: NSLayoutRelation.equal, toItem: self.contentView,
                                                  attribute: NSLayoutAttribute.bottom, multiplier: 1,
                                                  constant: 0)
        
        let constraintLeading = NSLayoutConstraint(item: jobDescription,
                                                   attribute: NSLayoutAttribute.leading,
                                                   relatedBy: NSLayoutRelation.equal, toItem: self.contentView,
                                                   attribute: NSLayoutAttribute.leadingMargin, multiplier: 1,
                                                   constant: 0)
        let constraintTrailing = NSLayoutConstraint(item: jobDescription,
                                                    attribute: NSLayoutAttribute.trailing,
                                                    relatedBy: NSLayoutRelation.equal, toItem: self.contentView,
                                                    attribute: NSLayoutAttribute.trailingMargin, multiplier: 1,
                                                    constant: 0)
        let constraintJobTitleTop = NSLayoutConstraint(item: jobTitle,
                                                       attribute: NSLayoutAttribute.top,
                                                       relatedBy: NSLayoutRelation.equal, toItem: self.contentView,
                                                       attribute: NSLayoutAttribute.top, multiplier: 1,
                                                       constant: 0)
        let constraintJobTitleHeight = NSLayoutConstraint(item: jobTitle,
                                                          attribute: NSLayoutAttribute.height,
                                                          relatedBy: NSLayoutRelation.equal, toItem: nil,
                                                          attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1,
                                                          constant: 30)
        let constraintJobTitleLeading = NSLayoutConstraint(item: jobTitle,
                                                           attribute: NSLayoutAttribute.leading,
                                                           relatedBy: NSLayoutRelation.equal, toItem: self.contentView,
                                                           attribute: NSLayoutAttribute.leadingMargin, multiplier: 1,
                                                           constant: 0)
        let constraintListingDateTop = NSLayoutConstraint(item: listingDate,
                                                          attribute: NSLayoutAttribute.top,
                                                          relatedBy: NSLayoutRelation.equal, toItem: self.jobTitle,
                                                          attribute: NSLayoutAttribute.bottom, multiplier: 1,
                                                          constant: 0)
        let constraintListingDateHeight = NSLayoutConstraint(item: listingDate,
                                                             attribute: NSLayoutAttribute.height,
                                                             relatedBy: NSLayoutRelation.equal, toItem: nil,
                                                             attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1,
                                                             constant: 20)
        let constraintListingDateLeading = NSLayoutConstraint(item: listingDate,
                                                              attribute: NSLayoutAttribute.leading,
                                                              relatedBy: NSLayoutRelation.equal, toItem: self.contentView,
                                                              attribute: NSLayoutAttribute.leadingMargin, multiplier: 1,
                                                              constant: 0)
        let constraintDescriptionHeight = NSLayoutConstraint(item: jobDescription,
                                                             attribute: NSLayoutAttribute.height,
                                                             relatedBy: NSLayoutRelation.greaterThanOrEqual, toItem: nil,
                                                             attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1,
                                                             constant: 20)
        self.contentView.addConstraints([ constraintTop,constraintBottom,constraintLeading, constraintTrailing,
                                          constraintDescriptionHeight ])
        
        self.contentView.addConstraints([constraintJobTitleTop,constraintJobTitleHeight, constraintJobTitleLeading])
        self.contentView.addConstraints([constraintListingDateTop,constraintListingDateHeight,constraintListingDateLeading])
    }
}
