//
// Created by Chris Brandsma on 1/4/18.
// Copyright (c) 2018 DBSoft. All rights reserved.
//
import Foundation
import UIKit

enum CSViewLoaderStyle {
    case navTo
    case inTab
}

class CSViewLoader {
    // used when navigating to a view via the navigation bar.
    // a back arrow will be presented to return to the previous view
    static let navTo = CSViewLoader(style: .navTo)
    
    // used when navigating via the tab bar at the bottom of the screen.
    // the navigation bar at the top of the screen should be hidden.
    // and views will be stored in a view dictionary for returning.
    static let inTab = CSViewLoader(style: .inTab)
    
    var style: CSViewLoaderStyle = .navTo
    var currentView: String = ""
    var viewDict: [String: UIViewController]? = nil
    
    init() {
    }
    
    init(style: CSViewLoaderStyle) {
        self.style = style
        
        if style == .inTab {
            self.viewDict = [String: UIViewController]()
        }
    }
    
    func display(_ id: String, _ vc: UIViewController) {
        self.currentView = id
        if style == .inTab {
            displayInNavController(vc)
        } else {
            navigateToView(vc)
        }
    }
    
    private func navigateToView(_ vc: UIViewController) {
        if let nc = navController() {
            nc.show(vc, sender: nil)
            return
        }
        displayInNavController(vc)
    }
    
    private func displayInNavController(_ vc: UIViewController) {
        let nc = UINavigationController(rootViewController: vc)
        
        if let w = UIApplication.shared.windows.first {
            w.makeKeyAndVisible()
            w.rootViewController = nc
        }
    }
    
    func navController() -> UINavigationController? {
        if let w = UIApplication.shared.windows.first {
            return w.rootViewController as? UINavigationController
        }
        return nil
    }
    
    func navBack() {
        if let nc = navController() {
            _ = nc.popViewController(animated: true)
        }
    }
    
    func clear() {
        self.viewDict?.removeAll(keepingCapacity: false)
    }
}

