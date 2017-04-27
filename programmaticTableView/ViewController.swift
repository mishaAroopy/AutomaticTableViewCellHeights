//
//  ViewController.swift
//  programmaticTableView
//
//  Created by AINSLIE YUEN on 4/27/17.
//  Copyright © 2017 Aroopy Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    var tableView: UITableView!
    var listings: [Listing]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTestListings()
        myLayoutVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func myLayoutVC(){
        tableView = UITableView(frame: CGRect( x: 0,y: 0,width: Int(self.view.frame.width), height: Int(self.view.frame.height) ))
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        tableView.register( listingCell.self, forCellReuseIdentifier: "listingCell")
        
        //This is the bit that let us have variable height cells
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
    }
    func createTestListings(){
        let Str1 = "Serve food, keep customers happy. Greet customers with a smile, take their orders.\n\nVery clean happy person required."
        let Str2 = "Mise en place. Maintain pantry supplies. All desserts for lunch and dinner to be prepared from 8am start."
        let Str3 = "Make coffee for high volume cafe situated in busy CBD office building foyer.\n\nYou'll be dealing with grumpy customers\n\nYou collect tips\n\nNo cleanup needed\n\nEarly finish (4pm)"
        let job1 = Listing(jobTitle: "Waiter", jobDescription: Str1, listingDate: Date())
        let job2 = Listing(jobTitle: "Pastry Chef", jobDescription: Str2, listingDate: Date() )
        let job3 = Listing(jobTitle: "Barista", jobDescription: Str3, listingDate: Date() )
        let job4 = Listing(jobTitle: "Kitchen Hand", jobDescription: "Food prep, cleaning", listingDate: Date())
        listings = []
        listings.append(job1!)
        listings.append(job2!)
        listings.append(job3!)
        listings.append(job4!)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return( listings.count )
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listingCell", for: indexPath) as! listingCell
        let thisListing = listings[ indexPath.row ]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a, EE dd MMM"
        cell.jobTitle.text = thisListing.jobTitle
        cell.jobDescription.text = thisListing.jobDescription
        cell.listingDate.text = dateFormatter.string(from: thisListing.listingDate)
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thisListing = listings[ indexPath.row ]
        print("You selected row \(indexPath.row)\nWith JobTitle\(thisListing.jobTitle)")
    }
}
