//
//  SettingsLabelSwitchTableViewCell.swift
//  BottomNavigationSwift
//
//  Created by Robert Wan on 23/3/2025.
//

import UIKit

class SettingsLabelSwitchTableViewCell: UITableViewCell, SettingsTableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var aSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        label.isAccessibilityElement = false
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
    
    func selected() {
        if UIAccessibility.isVoiceOverRunning {
            let on = aSwitch.isOn ? false : true
            updateAccessibility(label: label.text, on: on)
            aSwitch.setOn(on, animated: true)
        }
    }
}
