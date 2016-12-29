//
//  BlogTableCell.swift
//  SJTableView
//
//  Created by Jain Sakshi on 28/12/16.
//  Copyright © 2016 SnapDeal. All rights reserved.
//

import UIKit

class BlogTableCell: SJBaseTableCell {


    @IBOutlet weak var blogImageView: UIImageView!
    @IBOutlet weak var blogName: UILabel!
    @IBOutlet weak var blogUrl: UILabel!
    
    
    func loadCellWithBlogData(_ blogData: Dictionary <String, String>) {
        blogName?.text = blogData["name"]
        blogUrl?.text = blogData["url"]
        
    }
}
