//
//  ViewController.swift
//  AwesomeTableView
//
//  Created by Jagdeep Singh Matharu on 2019-03-22.
//  Copyright © 2019 Jagdeep. All rights reserved.
//

import UIKit

class InitialTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    
    private func registerCell() {
        tableView.registerCellWithNib(AppCellTableViewCell.self)
    }
}

extension InitialTableViewController {
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AppCellTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.nameLabel.text = "Hello"
        return cell
    }
}
