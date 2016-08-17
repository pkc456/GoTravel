//
//  HomeTravelBusinessLayer.swift
//  GoTravel
//
//  Created by Pardeep Chaudhary on 17/08/16.
//  Copyright © 2016 Pardeep Chaudhary. All rights reserved.
//

import Foundation

class HomeTravelBusinessLayer: NSObject {
    
    class var sharedInstance: HomeTravelBusinessLayer {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: HomeTravelBusinessLayer? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = HomeTravelBusinessLayer()
        }
        return Static.instance!
    }
    
    func parseArrayJsonData(data: NSArray) -> (NSMutableArray) {
        let responseArray: NSMutableArray = NSMutableArray.init(capacity: 0)
        
        for dictionary in data {
            let subDictionary: NSDictionary = (dictionary as? NSDictionary)!
            let modelObject: HomeTravel = HomeTravel()
            let dataInModelObject = modelObject.initWithDictionary(subDictionary)
            responseArray.addObject(dataInModelObject)
        }
        
        return responseArray
    }
}