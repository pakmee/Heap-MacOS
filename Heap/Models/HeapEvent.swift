//
//  IntercomEvent.swift
//  Intercom
//
//  Created by Maxime De Greve on 06/12/2018.
//  Copyright © 2018 Maxime De Greve. All rights reserved.
//

import Foundation

public struct HeapEvent: Codable {

    var appId: String
    var identity: String
    var event: String
    var properties: JSONValue?

    enum CodingKeys : String, CodingKey {
        case appId = "app_id"
        case identity = "identity"
        case event = "event"
        case properties = "properties"
    }

    public init(appId: String, identity: String, event: String, properties: [String: Any]?) throws {
        self.appId = appId
        self.identity = identity
        self.event = event
        
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
        event = try values.decode(String.self, forKey: .event)
        properties = try values.decode(JSONValue.self, forKey: .properties)
    }

}

