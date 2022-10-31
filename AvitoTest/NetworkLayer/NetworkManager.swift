//
//  NetworkManager.swift
//  AvitoTest
//
//  Created by Shamil Mazitov on 25.10.2022.
//

import Foundation
import Reachability

protocol NetworkManagerProtocol: AnyObject {
    func getData(completion: @escaping(Result<Information?,Error>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    private let url = URL(string: Constants.url)
    private var timeLeft = 3600
    private var reachability = try! Reachability()
    private let allowedDiskSize = 100 * 1024 * 1024
    private lazy var cache: URLCache = {
        return URLCache(memoryCapacity: 0, diskCapacity: allowedDiskSize, diskPath: "gifCache")
    }()
    private var timer = RepeatingTimer(timeInterval: 1)
    
    private func createAndRetrieveURLSession() -> URLSession {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.requestCachePolicy = .returnCacheDataElseLoad
        sessionConfiguration.urlCache = cache
        return URLSession(configuration: sessionConfiguration)
    }
    
    func getData(completion: @escaping(Result<Information?,Error>) -> Void) {
        
        guard let url = url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        timer.eventHandler = {
            self.timeLeft -= 1
            print(self.timeLeft)
            if self.timeLeft <= 0 {
                self.cache.removeAllCachedResponses()
                self.timer.suspend()
            }
        }
        timer.resume()
        if let cachedData = self.cache.cachedResponse(for: request) {
            print("Cached data in bytes:", cachedData.data)
            let result = try? JSONDecoder().decode(Information.self, from: cachedData.data)
            completion(.success(result))
        } else {
            createAndRetrieveURLSession().dataTask(with: request) { [weak self] data, responce, error in
                if error == nil {
                    guard let data = data else { return }
                    let cachedData = CachedURLResponse(response: responce!, data: data)
                    self?.cache.storeCachedResponse(cachedData, for: request)
                    let result = try? JSONDecoder().decode(Information.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                } else {
                    if let error = error {
                        completion(.failure(error))
                        print(error.localizedDescription)
                    }
                }
            }.resume()
            
            
            
        }
        
    }
    
}
