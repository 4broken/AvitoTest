//
//  AsseblyLayer.swift
//  AvitoTest
//
//  Created by Shamil Mazitov on 25.10.2022.
//

import UIKit

class AssemblyLayer {
    
    func assembly() -> UIViewController {
        let presenter = Presenter()
        let manager = NetworkManager()
        let controller = ViewController(presenter: presenter)
        presenter.controller = controller
        presenter.manager = manager
        
        return controller
    }
}
