//
//  AppDelegate.swift
//  Counter
//
//  Created by Олег Аксененко on 03.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print(#function, "Приложение загрузилось в память")
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print(#function, "Приложение стало активным, вернулось на передний план")
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print(#function, "Приложение собирается стать неактивным")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print(#function, "Приложение собирается вернутся на передний план, вызывается только из background")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print(#function, "Приложение перешло в состояние background")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print(#function, "Приложение заканчивает свою работу")
    }


}

