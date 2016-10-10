//
//  MasterItemViewController.swift
//  SplitViewControllerWithTabBarExample
//
//  Created by Gligor Kotushevski on 10/10/16.
//  Copyright © 2016 Gligor Kotushevski. All rights reserved.
//

import UIKit

class MasterItemViewController: UITableViewController {

    // MARK: - View Controller Loading Up Methods
    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
            controller.detailItem = String(describing: self.tableView.indexPathForSelectedRow!.row + 1)
            controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
            controller.navigationItem.leftItemsSupplementBackButton = true
        }
    }
    
    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel!.text = String(indexPath.row + 1)
        return cell
    }
}
