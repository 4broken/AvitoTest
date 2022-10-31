//
//  SceneDelegate.swift
//  AvitoTest
//
//  Created by Shamil Mazitov on 25.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let vc = AssemblyLayer().assembly()
        let navVC = UINavigationController(rootViewController: vc)
        self.window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }


}

