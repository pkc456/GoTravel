//
//  GAWebServiceHandler.swift
//

//MARK:- README
/*
 // I have created two generic methods for POST AND GET Api call. 
 // Create individual method for each api call.
*/

import UIKit
import Alamofire

class GAWebServiceHandler: NSObject {

    class var sharedInstance: GAWebServiceHandler {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: GAWebServiceHandler? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = GAWebServiceHandler()
        }
        return Static.instance!
    }
    
    // MARK: Common Request
    func PostApiRequest(method: Alamofire.Method, url: String, apiData: [String : AnyObject], completion:(finished: Bool, response: AnyObject?) ->Void) {
        Alamofire.request(method, url, parameters: apiData, encoding: .JSON, headers: nil).responseJSON{ response in
            if let JSON = response.result.value {
                completion(finished: true, response: JSON)
            } else {
                completion(finished: false, response:response.result.error)
            }
        }
    }
    
    func getApiRequest(method: Alamofire.Method, url: String, completion:(finished: Bool, response: AnyObject?) ->Void) {
        Alamofire.request(method, url, parameters: nil, encoding: .JSON, headers: nil).responseJSON{ response in
            if let JSON = response.result.value {
                completion(finished: true, response: JSON)
            } else {
                completion(finished: false, response:response.result.error)
            }
        }
    }
    
    
    // MARK: Get notification
    func fetchFlight(successBlock: (result: NSMutableArray?) -> Void, failureBlock:(error: NSError)->Void)
    {
        Utility.showLoader()
        
        self.getApiRequest(.GET, url: GET_Flight) { (finished, response) in
            if(finished)
            {
                let responseArray = response as! NSArray
                let result_collection : NSMutableArray = HomeTravelBusinessLayer.sharedInstance.parseArrayJsonData(responseArray)
                successBlock(result: result_collection)
            }
            else{
                let error = response as! NSError
                Utility.showAlertWithTitle("Error", message: error.debugDescription)
                failureBlock(error: error)
            }
            
            Utility.hideLoader()
        }
    }
    /*
    // MARK: Login
    func postLoginWithParam(params: [String : AnyObject], successBlock: (result: NSMutableArray?) -> Void, failureBlock:(error: NSError)->Void)
    {
        Utility.showLoader()
        
        self.PostApiRequest(.POST, url: API_LOGIN, apiData: params) { (finished, response) in
            if(finished)
            {
                let responseDict = response as! NSDictionary
                print(responseDict)
            }
            else{
                let error = response as! NSError
                Utility.showAlertWithTitle("Error", message: error.debugDescription)
                failureBlock(error: error)
            }
            
            Utility.hideLoader()
        }
    }
    */
    
}