//
//  SJBaseTableCell.swift
//  SJTableView
//
//  Created by Jain Sakshi on 28/12/16.
//  Copyright © 2016 SnapDeal. All rights reserved.
//

import UIKit

class SJBaseTableCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    class func loadTableViewCellFromNib() -> UITableViewCell {
    
        let nibName: String       = String(describing: self)
        let nibContents: Array    = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)!
        let cell: UITableViewCell!      = nibContents[0] as! UITableViewCell;
        cell.selectionStyle         = .none;
        cell.isExclusiveTouch = true
        cell.contentView.clipsToBounds = true
    
        return cell;
    }

}
