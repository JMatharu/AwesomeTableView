//
//  ReusableCell.swift
//  AwesomeTableView
//
//  Created by Jagdeep Singh Matharu on 2019-03-22.
//  Copyright © 2019 Jagdeep. All rights reserved.
//

import UIKit

protocol ReusableCell {}

extension UITableViewCell: ReusableCell {}

// Similarly
extension UICollectionViewCell: ReusableCell {}

extension ReusableCell {
    static var reuseID: String {
        return String(describing: self)
    }
}
