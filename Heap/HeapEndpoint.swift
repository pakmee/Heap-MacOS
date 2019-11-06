//
//  HeapEndpoint.swift
//  Marvel Prototyping
//
//  Created by Maxime De Greve on 06/12/2018.
//  Copyright © 2018 Maxime De Greve. All rights reserved.
//

import Foundation

enum HeapEndpoint: String {

    case track = "track"
    case addUserProperties = "add_user_properties"
    
    var url: String {
       return "https://heapanalytics.com/api/" + self.rawValue
    }

}
