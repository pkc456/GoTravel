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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ViewControllerTableCell") as! ViewControllerTableCell
        
        var imageName : String
        switch indexPath.row {
        case 0:
            imageName = "Test"
        case 1:
            imageName = "Test2"
        default:
            imageName = "Test3"
        }
        cell.imageviewAirline.image = UIImage(named: imageName)
        
        return cell
    }
    
    
    

}

