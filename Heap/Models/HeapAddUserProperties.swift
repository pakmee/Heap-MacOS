//
//  HeapAddUserProperties.swift
//  Heap
//
//  Created by Maxime De Greve on 06/11/2019.
//  Copyright © 2019 Marvel Prototyping. All rights reserved.
//

import Foundation

public struct HeapAddUserProperties: Codable {

    var appId: String
    var identity: String
    var properties: JSONValue?

    enum CodingKeys : String, CodingKey {
        case appId = "app_id"
        case identity = "identity"
        case properties = "properties"
    }

    public init(appId: String, identity: String, properties: [String: Any]?) throws {
        self.appId = appId
        self.identity = identity
        
        if let properties = properties {
            let decoder = JSONDecoder()
            let jsonData = try JSONSerialization.data(withJSONObject:properties)
            let values = try decoder.decode(JSONValue.self, from: jsonData)
            self.properties = values
        }
        
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        appId = try values.decode(String.self, forKey: .appId)
        identity = try values.decode(String.self, forKey: .identity)
        properties = try values.decode(JSONValue.self, forKey: .properties)
    }

}

