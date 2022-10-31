//
//  PresenterProtocolOutput.swift
//  AvitoTest
//
//  Created by Shamil Mazitov on 25.10.2022.
//

import Foundation

extension Presenter: PresenterOutputProtocol{
    func getData() {
        
        manager.getData { [weak self] info in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch info {
                case .success(let result):
                    guard let result = result else { return }
                    self.infoArray.append(result)
                    self.controller?.success()
                    
                case .failure(let error):
                    self.controller?.failure(error: error)
                    
                }
            }
        }
        
        
    }
}
