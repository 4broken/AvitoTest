//
//  Presenter.swift
//  AvitoTest
//
//  Created by Shamil Mazitov on 25.10.2022.
//

import Foundation

protocol PresenterOutputProtocol {
    func getData()
    var infoArray: [Information] { get set }
}

protocol PresenterInputProtocol: AnyObject {
    var controller: ViewControllerInputProtocol? { get }
}

final class Presenter: PresenterInputProtocol {
    
    weak var controller: ViewControllerInputProtocol?
    var infoArray: [Information] = []
    var manager: NetworkManagerProtocol!
    
    
    required init() {
        
    }
    
}
