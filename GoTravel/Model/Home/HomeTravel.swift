//
//  HomeTravel.swift
//  GoTravel
//
//  Created by Pardeep Chaudhary on 17/08/16.
//  Copyright © 2016 Pardeep Chaudhary. All rights reserved.
//

import Foundation

class HomeTravel: NSObject {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    let kHomeTravelPriceKey: String = "price_in_euros"
    let kHomeTravelIdKey: String = "id"
    let kHomeTravelNumberOfStopsKey: String = "number_of_stops"
    let kHomeTravelArrivalTimeKey: String = "arrival_time"
    let kHomeTravelDepartureTimeKey: String = "departure_time"
    let kHomeTravelProviderLogoKey: String = "provider_logo"
        
    var price: String!
    var arrivalTime: String!
    var departureTime: String!
    var logo: String?
    var idIdentifier: Int?
    var numberOfStops: Int!
    var duration: Float!
    
    func initWithDictionary(dictionary: NSDictionary) -> (AnyObject) {
        
        self.idIdentifier = dictionary[kHomeTravelIdKey]?.integerValue ?? 0
        self.numberOfStops = dictionary[kHomeTravelNumberOfStopsKey]?.integerValue ?? 0
        self.price = dictionary[kHomeTravelPriceKey] as? String ?? ""
        self.arrivalTime = dictionary[kHomeTravelArrivalTimeKey] as? String ?? ""
        self.departureTime = dictionary[kHomeTravelDepartureTimeKey] as? String ?? ""
        self.logo = dictionary[kHomeTravelProviderLogoKey] as? String ?? ""
        self.logo = self.logo?.stringByReplacingOccurrencesOfString("{size}", withString: "63")
        self.duration = self.setDuration(self.arrivalTime, departureTime: self.departureTime)
        
        return self
    }
    
    //It will return duration in float (eg: 4.50)
    func setDuration(arrivalTime : String, departureTime : String) -> Float{
        
        let arrivalTime = arrivalTime.stringByReplacingOccurrencesOfString(":", withString: ".")
        let departureTime = departureTime.stringByReplacingOccurrencesOfString(":", withString: ".")
        let duration = Float(arrivalTime)! - Float(departureTime)!
        return duration
    }
}