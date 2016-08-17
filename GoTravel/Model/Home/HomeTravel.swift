//
//  HomeTravel.swift
//  GoTravel
//
//  Created by Pardeep Chaudhary on 17/08/16.
//  Copyright © 2016 Pardeep Chaudhary. All rights reserved.
//

import Foundation

class HomeTravel: NSObject {
    
    var arrivalTime: String?
    var departureTime: String?
    var logo: String?
    var idIdentifier: Int?
    var numberOfStops: Int?
    
    
    func initWithDictionary(dictionary: NSDictionary) -> (AnyObject) {
        
        self.idIdentifier = dictionary["id"]?.integerValue ?? 0
        self.numberOfStops = dictionary["number_of_stops"]?.integerValue ?? 0
        self.arrivalTime = dictionary["arrival_time"] as? String ?? ""
        self.logo = dictionary["provider_logo"] as? String ?? ""
        self.departureTime = dictionary["departure_time"] as? String ?? ""
        
        return self
    }
    
}