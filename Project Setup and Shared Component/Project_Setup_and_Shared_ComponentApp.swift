//
//  Project_Setup_and_Shared_ComponentApp.swift
//  Project Setup and Shared Component
//
//  Created by Saurabh  Verma on 13/04/24.
//

import SwiftUI
import SwiftfulRouting
@main
struct Project_Setup_and_Shared_ComponentApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
        }
    }
}
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
