//
//  MenuViewController.swift
//  tableView
//
//  Created by Carlos Mendieta on 4/15/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit

protocol MenuViewControllerDelegate {
    func didSelectOption(_ option: Int)
}

class MenuViewController: UIViewController {
    let menuViewModel = MenuViewModel()
    var delegate: MenuViewControllerDelegate!
    var options: [String]!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
}
// MARK: Table View Data Source
extension MenuViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuViewModel.options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionCell", for: indexPath) as! OptionCell
        cell.optionLabel.text = menuViewModel.options[indexPath.row]
        return cell
    }
}
// MARK: Table View Delegate`
extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelectOption(indexPath.row)
    }
}

