//
//  ViewController.swift
//  GoTravel
//
//  Created by Pardeep Chaudhary on 17/08/16.
//  Copyright © 2016 Pardeep Chaudhary. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIActionSheetDelegate {
    @IBOutlet weak var tableviewData: UITableView!
    //    var arrayTravelOptions : NSMutableArray! = []
    var arrayTravelOptions = [HomeTravel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.fetchFlight()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Button action
    @IBAction func btnSortAction(sender: UIBarButtonItem) {
        let actionSheet = UIActionSheet(title: "Sort by", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil, otherButtonTitles: "Departure time", "Arrival time", "Duration", "Cost")
        actionSheet.showInView(self.view)
    }
    
    // MARK: Web service interaction
    func fetchFlight(){
        GAWebServiceHandler.sharedInstance.fetchFlight({ (result) in
            self.arrayTravelOptions.removeAll()
            self.arrayTravelOptions = result!.mutableCopy() as! [HomeTravel]
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
        let travelOption : HomeTravel = arrayTravelOptions[indexPath.row]
        cell.configureCellWithData(travelOption)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        Utility.showAlertWithTitle("", message: DetailNotImplemented)
    }
    
    
    //MARK: action sheet Delegate Method
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int)
    {
        switch buttonIndex{
            case 1:     //Departure time
                arrayTravelOptions.sortInPlace{ $0.departureTime < $1.departureTime }
                break;
            case 2:     //Arrival time
                arrayTravelOptions.sortInPlace{ $0.arrivalTime < $1.arrivalTime }
                break;
            case 3:     //Duration
                arrayTravelOptions.sortInPlace{ $0.duration < $1.duration }
            case 4:     //Cost
                arrayTravelOptions.sortInPlace{ $0.price < $1.price }
                break;
            default:
                break;
        }
        self.tableviewData.reloadData()
        
    }
}