//
//  BaseWebService.swift
//  SJTableView
//
//  Created by Jain Sakshi on 29/12/16.
//  Copyright © 2016 SnapDeal. All rights reserved.
//

import UIKit
import Alamofire

class BaseWebService {
    
    func baseURL() -> String {
        
        return WEBSERVICE_BASE_URL
    }
    
    func relativeURL() -> String {
        
        return ""
    }
    
    func completeURL() -> String {
        
        return self.baseURL() + "/" + self.relativeURL()
    }

    func executeGetRequest(completion:@escaping (_ result: Any?, _ error:Error?) -> Void) {
        
        let url = self.completeURL()
        Alamofire.request(url).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                   // print(response.result.value ?? "performAction")
                    completion(self.performActionOnResponse(response.result.value),nil)
                }
                break
                
            case .failure(_):
                completion(nil,response.result.error)
                break
                
            }
        }
    }
    
    func performActionOnResponse(_ responseObject: Any?) -> Any {
        
        return responseObject ?? "";
    }
    
}
