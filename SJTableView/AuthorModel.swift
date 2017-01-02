//
//  AuthorModel.swift
//  SJBlogApp
//
//  Created by Jain Sakshi on 02/01/17.
//  Copyright © 2017 SnapDeal. All rights reserved.
//

import UIKit

class AuthorModel: NSObject {
    
    var firstName: String = ""
    var lastName: String = ""
    var fullName: String = ""
    var url: String = ""
    
    class func createAuthor(_ dict: Dictionary<String, Any>) -> AuthorModel {
        
        let author: AuthorModel = AuthorModel()
        author.firstName = dict["first_name"] as! String
        author.lastName = dict["last_name"] as! String
        author.fullName = author.firstName + " " + author.lastName
        author.url = dict["url"] as! String
        
        return author
    }

}
