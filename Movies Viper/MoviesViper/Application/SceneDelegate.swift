//
//  SceneDelegate.swift
//  Movies Viper
//
//  Created by Vitor Ferraz Varela on 15/06/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        initMainScreen()
    }

    private func initMainScreen() {
        let navigationControllerMain = MovieListRouter().build()
        window?.rootViewController = navigationControllerMain
        window?.makeKeyAndVisible()
    }
}
