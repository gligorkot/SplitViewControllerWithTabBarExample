//
//  CustomSplitViewController.swift
//  SplitViewControllerWithTabBarExample
//
//  Created by Gligor Kotushevski on 10/10/16.
//  Copyright © 2016 Gligor Kotushevski. All rights reserved.
//

import UIKit

class CustomSplitViewController: UISplitViewController {

    // MARK: - View Controller Loading Up Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        self.preferredDisplayMode = UISplitViewControllerDisplayMode.allVisible
    }
    
}

// MARK: - UISplitViewControllerDelegate
extension CustomSplitViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }
}
