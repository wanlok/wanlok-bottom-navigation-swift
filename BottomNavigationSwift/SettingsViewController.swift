//
//  SettingsViewController.swift
//  BottomNavigationSwift
//
//  Created by Robert Wan on 22/3/2025.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let labels = ["Alice", "Bob", "Charlie"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsTableViewCell")
        tableView.register(UINib(nibName: "SettingsSwitchTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsSwitchTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labels.count
    }
    
    func dequeueSettingsTableViewCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath)
        guard let cell = cell as? SettingsTableViewCell else {
            return cell
        }
        let label = labels[indexPath.row]
        cell.aTextLabel?.text = label
        return cell
    }
    
    func dequeueSettingsSwitchTableViewCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsSwitchTableViewCell", for: indexPath)
        guard let cell = cell as? SettingsSwitchTableViewCell else {
            return cell
        }
        let label = labels[indexPath.row]
        cell.aTextLabel?.text = label
        cell.updateAccessibility(label: label, on: true)
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return indexPath.row == 1 ? dequeueSettingsSwitchTableViewCell(indexPath) : dequeueSettingsTableViewCell(indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if UIAccessibility.isVoiceOverRunning {
            if let cell = tableView.cellForRow(at: indexPath) as? SettingsSwitchTableViewCell {
                let on = cell.aSwitch.isOn ? false : true
                cell.updateAccessibility(label: cell.aTextLabel.text, on: on)
                cell.aSwitch.setOn(on, animated: true)
            }
        }
    }
}
