//
//  RezultTableViewCell.swift
//  FootballSimulator
//
//  Created by Vladimir on 25.09.17.
//  Copyright © 2017 Vladimir. All rights reserved.
//

import UIKit

class RezultTableViewCell: UITableViewCell {

    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var played: UILabel!
    @IBOutlet weak var pts: UILabel!
    @IBOutlet weak var lost: UILabel!
    @IBOutlet weak var drawn: UILabel!
    @IBOutlet weak var won: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
