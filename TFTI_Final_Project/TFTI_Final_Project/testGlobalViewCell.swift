//
//  testGlobalViewCell.swift
//  TFTI_Final_Project
//
//  Created by pal on 5/2/17.
//  Copyright © 2017 Sahana Srinivasan. All rights reserved.
//

import UIKit

class testGlobalViewCell: UITableViewCell {
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var dateOfEvent: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var goingImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


}
