//
//  ViewController.swift
//  GoTravel
//
//  Created by Pardeep Chaudhary on 17/08/16.
//  Copyright © 2016 Pardeep Chaudhary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableviewData: UITableView!
    var arrayTravelOptions : NSMutableArray! = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.fetchFlight()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fetchFlight(){
        GAWebServiceHandler.sharedInstance.fetchFlight({ (result) in
            self.arrayTravelOptions = result
            self.tableviewData.reloadData()
        }) { (error) in
            print("Error: %@",error)
        }
    }
    
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return arrayTravelOptions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ViewControllerTableCell") as! ViewControllerTableCell
        let travelOption : HomeTravel = arrayTravelOptions[indexPath.row] as! HomeTravel
        cell.configureCellWithData(travelOption)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        Utility.showAlertWithTitle("Error", message: DetailNotImplemented)

    }

}