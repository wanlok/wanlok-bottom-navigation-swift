//
//  SettingsSwitchTableViewCell.swift
//  BottomNavigationSwift
//
//  Created by Robert Wan on 23/3/2025.
//

import UIKit

class SettingsSwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var aTextLabel: UILabel!
    @IBOutlet weak var aSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        aTextLabel.isAccessibilityElement = false
        aSwitch.isAccessibilityElement = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateAccessibility(label: String?, on: Bool?) {
        if let label = label {
            accessibilityLabel = label
        }
        if let on = on {
            accessibilityValue = on ? "On" : "Off"
        }
    }
}
