//
//  AuthorListWebService.swift
//  SJTableView
//
//  Created by Jain Sakshi on 29/12/16.
//  Copyright © 2016 SnapDeal. All rights reserved.
//

import UIKit

class AuthorListWebService: BaseWebService {
    
    override func relativeURL() -> String {
        return CONTACT_LIST_URL
    }
    
    override func performActionOnResponse(_ responseObject: Any?) -> Any {
        
        var authorArray: Array = [AuthorModel] ()
        if (responseObject != nil) {
            
            for dict in responseObject as! [Dictionary<String, Any>] {
                
                let model: AuthorModel = AuthorModel.createAuthor(dict)
                authorArray.append(model)
            }
        }
        
        let descriptor: NSSortDescriptor = NSSortDescriptor(key: "firstName", ascending: true)
        let sortedResults = NSArray(array: authorArray).sortedArray(using: [descriptor])

        return sortedResults
    }
 

}
