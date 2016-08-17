//
//  ViewControllerTableCell.swift
//  GoTravel
//
//  Created by Pardeep Chaudhary on 17/08/16.
//  Copyright © 2016 Pardeep Chaudhary. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class ViewControllerTableCell: UITableViewCell {
    
    @IBOutlet weak var imageviewAirline: UIImageView!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelDuration: UILabel!
 
    func configureCellWithData(homeTravelModelObject : HomeTravel)
    {
        labelPrice.text = "€ \(homeTravelModelObject.price)"
        self.setAttributedTextOnTimeLabel(homeTravelModelObject.departureTime, arrivalTime: homeTravelModelObject.arrivalTime)
        self.setDurationText(homeTravelModelObject)
        
        let url: NSURL = NSURL(string: homeTravelModelObject.logo!)!
        let placeHolder : UIImage = UIImage(named:"thumbnail")!
        self.imageviewAirline.af_setImageWithURL(url, placeholderImage: placeHolder)
    }
    
    func setAttributedTextOnTimeLabel(departureTime : String, arrivalTime : String){
        let departureAttribute = [
            NSFontAttributeName : UIFont.systemFontOfSize(14.0),
            NSForegroundColorAttributeName : UIColor.blackColor(),
        ]
        let departureAttributedString = NSMutableAttributedString(string: String(format: "%@ ⇾ ", departureTime), attributes: departureAttribute)

        let arrivalAttribute = [
            NSFontAttributeName : UIFont.systemFontOfSize(12.0),
            NSForegroundColorAttributeName : UIColor.lightGrayColor(),
            ]
        let arrivalAttributedString = NSAttributedString(string: String(format: "%@", arrivalTime), attributes: arrivalAttribute)
        
        departureAttributedString.appendAttributedString(arrivalAttributedString)
        labelTime.attributedText = departureAttributedString
    }
    
    func setDurationText(homeTravelModelObject : HomeTravel){
        let arrivalTime = homeTravelModelObject.arrivalTime.stringByReplacingOccurrencesOfString(":", withString: ".")
        let departureTime = homeTravelModelObject.departureTime.stringByReplacingOccurrencesOfString(":", withString: ".")
        let duration = Float(arrivalTime)! - Float(departureTime)!
        var durationInString = String(format:"%.2f", duration)
        durationInString = durationInString.stringByReplacingOccurrencesOfString(".", withString: ":")
        durationInString = durationInString + " h "
        
        let stops = homeTravelModelObject.numberOfStops > 0 ? "\(homeTravelModelObject.numberOfStops) stops" : "Direct"
        
        labelDuration.text = "\(durationInString)| \(stops)"
    }
    
}