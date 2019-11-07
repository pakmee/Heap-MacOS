//
//  HeapTrackMethods.swift
//  Marvel Prototyping
//
//  Created by Maxime De Greve on 06/12/2018.
//  Copyright © 2018 Maxime De Greve. All rights reserved.
//

import Foundation

public class HeapEventsMethods {

    public func track(event: String, properties: [String: Any]?, timestamp: Date? = nil) throws {

        guard Heap.shared.isSetup else {
            throw HeapError.noSetup
        }
        
        guard
           let appId = Heap.shared.appId,
           let identity = Heap.shared.identity else {
           throw HeapError.noAppIdOrIdentity
       }

        guard let event = try? HeapEvent(appId: appId, identity: identity, event: event, properties: properties, timestamp: timestamp ?? Date()) else {
            throw HeapError.invalidProperties
        }
        
        let encodedData = try JSONEncoder().encode(event)

        let connection = HeapConnection(endpoint: .track)
        connection.request.httpBody = encodedData

        try connection.start()

    }

}
