//
//  TextTableViewCell.swift
//  MasterCopy
//
//  Created by aam imac on 12/11/2015.
//  Copyright © 2015 jeffery leo. All rights reserved.
//

import UIKit

class TextTableViewCell: PFTableViewCell
{
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet var btnCopy: UIButton!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
