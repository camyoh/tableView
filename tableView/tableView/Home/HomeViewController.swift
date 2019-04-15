//
//  ViewController.swift
//  tableView
//
//  Created by Carlos Mendieta on 4/15/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit

@objc
protocol HomeViewControllerDelegate {
    @objc optional func toggleLeftPanel()
    @objc optional func collapseSidePanels()

}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var delegate: HomeViewControllerDelegate!
    
    @IBAction func menuTapped(_ sender: UIBarButtonItem) {
        delegate.toggleLeftPanel?()
    }
}

extension HomeViewController: MenuViewControllerDelegate {
    func didSelectOption(_ option: String) {
        let homeViewModel = HomeViewModel(labelText: option)
        label.text = homeViewModel.labelText
        delegate.collapseSidePanels?()
    }
}

