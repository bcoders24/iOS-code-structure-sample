//
//  NavigationController.swift
//  TestApp
//
//  Created by Jagdeep Singh on 04/06/24.
//

import SwiftUI

struct NavigationUtil {
    static func popToRootView(animated: Bool = false) {
        findNavigationController(viewController: UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow }?.rootViewController)?.popToRootViewController(animated: animated)
    }
    
    static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }
        
        if let navigationController = viewController as? UITabBarController {
            return findNavigationController(viewController: navigationController.selectedViewController)
        }
        
        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }
        
        for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }
        
        return nil
    }
}
