//
//  Constants.swift
//
//  Created by Pardeep Chaudhary.
//  Copyright © 2016 Pardeep Chaudhary. All rights reserved.
//

import Foundation
import UIKit

// WEBSERVICE MACRO
let BASE_URL = "https://api.myjson.com/bins/"

let GET_Flight = BASE_URL + "w60i"
let GET_Train = BASE_URL + "3zmcy"
var GET_Bus = BASE_URL + "37yzm"

enum TravelType{
    case TRAIN
    case BUS
    case FLIGHT
}

//MARK: - AppDelagate Constant
var APP_DELEGATE : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate


let DetailNotImplemented = "Offer details are not yet implemented!"