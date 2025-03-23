//
//  SettingsLabelTableViewCell.swift
//  BottomNavigationSwift
//
//  Created by Robert Wan on 23/3/2025.
//

import UIKit

class SettingsLabelTableViewCell: UITableViewCell, SettingsTableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func selected() {
        
    }
}
