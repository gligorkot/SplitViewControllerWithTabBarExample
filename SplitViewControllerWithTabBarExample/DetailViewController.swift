//
//  DetailViewController.swift
//  SplitViewControllerWithTabBarExample
//
//  Created by Gligor Kotushevski on 10/10/16.
//  Copyright © 2016 Gligor Kotushevski. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var detailDescriptionLabel: UILabel!

    // MARK: - Variables
    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    // MARK: - View Controller Loading Up Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    
    // MARK: - Private Methods
    private func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail
            }
        }
    }

}
