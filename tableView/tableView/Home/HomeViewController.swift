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
    
    var delegate: HomeViewControllerDelegate!
    var homeViewModel = HomeViewModel()
    
    @IBOutlet weak var eventsTableView: UITableView!
    
    @IBAction func menuTapped(_ sender: UIBarButtonItem) {
        delegate.toggleLeftPanel?()
    }
}

extension HomeViewController: MenuViewControllerDelegate {
    func didSelectOption(_ option: String) {
//        let homeViewModel = HomeViewModel(labelText: option)
        delegate.collapseSidePanels?()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noImageCell = tableView.dequeueReusableCell(withIdentifier: "NoImageCell", for: indexPath) as! NoImageCell
//        let imageCell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
        noImageCell.eventDescription.text = homeViewModel.getDescription(index: indexPath.row)
        noImageCell.eventTitle.text = homeViewModel.getTitle(index: indexPath.row)
        return noImageCell
    }
    
    
}
