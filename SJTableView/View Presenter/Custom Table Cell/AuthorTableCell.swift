//
//  BlogTableCell.swift
//  SJTableView
//
//  Created by Jain Sakshi on 28/12/16.
//  Copyright © 2016 SnapDeal. All rights reserved.
//

import UIKit

class AuthorTableCell: SJBaseTableCell {


    @IBOutlet weak var blogImageView: UIImageView!
    @IBOutlet weak var blogName: UILabel!
    @IBOutlet weak var blogUrl: UILabel!
    
    
    func loadCellWithAuthorData(_ authorData: AuthorModel) {
        blogName?.text = authorData.fullName
        blogUrl?.text = authorData.url
        
    }
}
