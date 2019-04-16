//
//  Decode.swift
//  tableView
//
//  Created by Yoh on 4/15/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import Foundation

class RequestModel {
    
    static func getEventsData() -> [Event] {
        var events: [Event] = []
        let url = Bundle.main.url(forResource: "ImsaData", withExtension: "json")!
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONDecoder().decode(Events.self, from: data)
            events = json.events
        }
        catch {
            print("Error occured during Parsing", error)
        }
        return events
    }
    
}

