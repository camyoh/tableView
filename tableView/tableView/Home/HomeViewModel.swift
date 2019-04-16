//
//  HomeViewModel.swift
//  tableView
//
//  Created by Carlos Mendieta on 4/15/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import Foundation

struct HomeViewModel {

    let events = RequestModel.getEventsData()
    
    func getTitle(index: Int) -> String {
        return events[index].name
    }
    
    func getDescription(index: Int) -> String {
        return events[index].description ?? ""
    }
    
    func getImage(index: Int) -> String {
        return events[index].image
    }
}
