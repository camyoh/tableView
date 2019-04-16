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
    var option = 1
    @IBOutlet weak var eventsTableView: UITableView!
    
    @IBAction func menuTapped(_ sender: UIBarButtonItem) {
        delegate.toggleLeftPanel?()
    }
}

extension HomeViewController: MenuViewControllerDelegate {
    func didSelectOption(_ option: Int) {
        self.option = option
        eventsTableView.reloadData()
        print(option)
        delegate.collapseSidePanels?()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noImageCell = tableView.dequeueReusableCell(withIdentifier: "NoImageCell", for: indexPath) as! NoImageCell
        let imageCell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
        
        noImageCell.eventDescription.text = homeViewModel.getDescription(index: indexPath.row)
        noImageCell.eventTitle.text = homeViewModel.getTitle(index: indexPath.row)
        
        imageCell.eventTitle.text = homeViewModel.getTitle(index: indexPath.row)
        imageCell.eventDescription.text = homeViewModel.getDescription(index: indexPath.row)
        imageCell.eventImage.image = UIImage(named: homeViewModel.getImage(index: indexPath.row))
        
        switch option {
        case 0:
            return noImageCell
        case 1:
            return imageCell
        case 2:
            if indexPath.row.isMultiple(of: 2){
                return noImageCell
            }else {
                return imageCell
            }
        default:
            return noImageCell
        }
    }
    
    
}
