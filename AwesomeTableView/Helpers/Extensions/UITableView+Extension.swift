//
//  UITableView+Extension.swift
//  AwesomeTableView
//
//  Created by Jagdeep Singh Matharu on 2019-03-22.
//  Copyright © 2019 Jagdeep. All rights reserved.
//

import UIKit

extension UITableView {
    func registerCellWithNib<Cell: UITableViewCell>(_ cell: Cell.Type) {
        register(UINib(nibName: cell.reuseID, bundle: nil),
                 forCellReuseIdentifier: Cell.reuseID)
    }
    
    func registerCell<Cell: UITableViewCell>(_ cell: Cell.Type) {
        register(cell, forCellReuseIdentifier: cell.reuseID)
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: Cell.reuseID, for: indexPath) as? Cell else {
            fatalError("Unable to load cell at IndexPath \(indexPath)")
        }
        return cell
    }
}
