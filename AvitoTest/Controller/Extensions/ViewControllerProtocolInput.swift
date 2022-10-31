//
//  ViewControllerProtocolInput.swift
//  AvitoTest
//
//  Created by Shamil Mazitov on 25.10.2022.
//

import Foundation

extension ViewController:ViewControllerInputProtocol {
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    func success() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        informationArr = presenter.infoArray
        print(informationArr)
        self.navigationItem.title = informationArr.compactMap {$0.company.name}.first
        navigationController?.navigationBar.prefersLargeTitles = true
        print("success")
    }
    
    
    
    
}
