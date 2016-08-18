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
    var arrayTravelOptions = [HomeTravel]()
    @IBOutlet var labelNoDataFound: UILabel!
    @IBOutlet var buttonSort: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchTravelOption(TravelType.TRAIN)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Button action
    @IBAction func btnSortAction(sender: UIBarButtonItem) {
        let actionSheet = UIActionSheet(title: "Sort by", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil, otherButtonTitles: "Departure time", "Arrival time", "Duration", "Cost")
        actionSheet.showInView(self.view)
    }
    
    
    @IBAction func valueChangedAction(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.fetchTravelOption(TravelType.TRAIN)
        case 1:
            self.fetchTravelOption(TravelType.BUS)
        case 2:
            self.fetchTravelOption(TravelType.FLIGHT)
        default:
            break
            
        }
    }
    
    // MARK: Web service interaction
    func fetchTravelOption(travelTypeOption : TravelType){
        GAWebServiceHandler.sharedInstance.fetchTravelOptionsList(travelTypeOption, showLoader:true, successBlock: { (result) in
            self.arrayTravelOptions.removeAll()
            self.arrayTravelOptions = result!.mutableCopy() as! [HomeTravel]                        
            self.labelNoDataFound.hidden = self.arrayTravelOptions.count > 0 ? true : false
            self.buttonSort.enabled = self.arrayTravelOptions.count > 0 ? true : false
            self.tableviewData.reloadData()
            }) { (error) in
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