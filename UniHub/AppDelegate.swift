//
//  AppDelegate.swift
//  UniHub
//
//  Created by Aizat Ozbekova on 13/12/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            window = UIWindow(frame: UIScreen.main.bounds)
            
            // Создаем экземпляр MainViewController
            let mainViewController = MainViewController()

            // Создаем UINavigationController с MainViewController в качестве корневого контроллера
            let navigationController = UINavigationController(rootViewController: mainViewController)

            // Назначаем UINavigationController корневым контроллером окна
            window?.rootViewController = navigationController

            // Делаем окно видимым
            window?.makeKeyAndVisible()

            return true
        }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

