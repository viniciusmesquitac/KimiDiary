//
//  AppRouter.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 14/07/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

struct AppRouter {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        createRouteByState()
    }
    
    func createRouteByState() {
        
        UserDefaultsManager.verifyState { (state) in
                        
            switch state {
            case .firstLogin:
                sendToMainController()
            case .alreadyLogged:
                sendToMainController()
            }
            
        }
    }
    
    private func sendToOnboard() {
        let viewController = MenuDiaryViewController()

        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
    
    private func sendToMainController() {
        let viewController = MenuDiaryViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}
