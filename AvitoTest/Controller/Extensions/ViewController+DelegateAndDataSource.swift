//
//  ViewController+DelegateAndDataSource.swift
//  AvitoTest
//
//  Created by Shamil Mazitov on 29.10.2022.
//

import UIKit

extension ViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return informationArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let info = informationArr[section].company.employees.count
        return info
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        let info = informationArr[0].company.employees.sorted { $0.name < $1.name }[indexPath.row]
        let skills = info.skills.joined(separator: ", ")
        cell.configureCell(with: info.name, phoneLabelText: info.phoneNumber, skillsText: skills)
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
