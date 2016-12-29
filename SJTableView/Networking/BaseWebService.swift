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

    func getRequest(parameters:Dictionary <String, Any>) {
        
        let url = self.completeURL()
        Alamofire.request(url).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    print(response.result.value ?? "API success but no response")
                }
                break
                
            case .failure(_):
                print(response.result.error ?? "API failed")
                break
                
            }
        }
    }
    
    func performActionOnResponse(_ responseObject: Any?) -> Any {
        return responseObject ?? ""
    }
}
