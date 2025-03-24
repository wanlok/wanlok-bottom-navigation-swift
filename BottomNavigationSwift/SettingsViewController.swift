//
//  SettingsViewController.swift
//  BottomNavigationSwift
//
//  Created by Robert Wan on 22/3/2025.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let labels = ["Row 1", "Row 2", "Row 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SettingsLabelTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsLabelTableViewCell")
        tableView.register(UINib(nibName: "SettingsLabelSwitchTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsLabelSwitchTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if indexPath.row == 1 {
            cell = dequeueSettingsLabelSwitchTableViewCell(indexPath)
        } else {
            cell = dequeueSettingsLabelTableViewCell(indexPath)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        (tableView.cellForRow(at: indexPath) as? SettingsTableViewCell)?.selected()
    }
    
    func dequeueSettingsLabelTableViewCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsLabelTableViewCell", for: indexPath)
        guard let cell = cell as? SettingsLabelTableViewCell else {
            return cell
        }
        let label = labels[indexPath.row]
        cell.label?.text = label
        return cell
    }
    
    func dequeueSettingsLabelSwitchTableViewCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsLabelSwitchTableViewCell", for: indexPath)
        guard let cell = cell as? SettingsLabelSwitchTableViewCell else {
            return cell
        }
        let label = labels[indexPath.row]
        cell.label?.text = label
        cell.updateAccessibility(label: label, on: true)
        return cell
    }
}
