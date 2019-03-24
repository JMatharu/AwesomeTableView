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

extension InitialTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let row = UserProfileSection.row(for: textField.tag)
        let userCache = UserProfileCache()
        userCache[row] = textField.text
        return false
    }
}

extension InitialTableViewController {
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        let section = UserProfileSection(rawValue: section)
        return section?.rows.count ?? 0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return UserProfileSection.allCases.count
    }
    
    override func tableView(_ tableView: UITableView,
                            titleForHeaderInSection section: Int) -> String? {
        let section = UserProfileSection(rawValue: section)
        return section?.title
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AppCellTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let section = UserProfileSection(rawValue: indexPath.section)
        let row = section?.rows[indexPath.row]
        let tag = UserProfileSection.tag(for: row)
        cell.itemTextField.tag = tag
        cell.nameLabel.text = row?.title
        cell.itemTextField.placeholder = row?.placeHolder
        cell.nameLabel.textColor = row?.isValid(for: cell.itemTextField.text) ?? false ? .red : .green
        return cell
    }
}

extension InitialTableViewController {
    enum UserProfileRow: String {
        case firstName = "First Name"
        case lastName = "Last Name"
        case zipCode = "Zip Code"
        case height = "Height"
        case weight = "Weight"
        case size = "Size"
        
        var title: String {
            return self.rawValue
        }
        
        var isOptional: Bool {
            switch self {
            case .zipCode, .height, .weight:
                return true
            default:
                return false
            }
        }
        
        var placeHolder: String {
            return isOptional ? "Optional" : "Required"
        }
        
        func isValid(for value: String?) -> Bool {
            return value?.count ?? 0 > 2
        }
    }
    
    enum UserProfileSection: Int, CaseIterable {
        case personal
        case sizing
        
        var title: String {
            switch self {
            case .personal:
                return "Personal Info"
            case .sizing:
                return "Sizing Info"
            }
        }
        
        var rows: [UserProfileRow] {
            switch self {
            case .personal:
                return [.firstName, .lastName, .zipCode]
            case .sizing:
                return [.height, .weight, .size]
            }
        }
        
        static var allRows: [UserProfileRow] {
            return UserProfileSection.allCases.flatMap{ $0.rows }
        }
        
        static func tag(for row: UserProfileRow?) -> Int {
            if let row = row {
                return allRows.firstIndex(of: row) ?? -1
            }
            return -1
        }
        
        static func row(for tag: Int) -> UserProfileRow {
            return  allRows[tag]
        }
    }
}

extension InitialTableViewController {
    class UserProfileCache {
        var firstName: String?
        var lastName: String?
        var zipCode: String?
        var height: String?
        var weight: String?
        var size: String?
        
        subscript(row: UserProfileRow) -> String? {
            get {
                return value(for: row)
            }
            set(newValue) {
                set(value: newValue, for: row )
            }
        }
        
        private func value(for row: UserProfileRow) -> String? {
            switch row {
            case .firstName: return firstName
            case .lastName: return lastName
            case .zipCode: return zipCode
            case .height: return height
            case .weight: return weight
            case .size: return size
            }
        }
        
        private func set(value: String?, for row: UserProfileRow) {
            switch row {
            case .firstName: firstName = value
            case .lastName: lastName = value
            case .zipCode: zipCode = value
            case .height: height = value
            case .weight: weight = value
            case .size: size = value
            }
        }
    }

}
