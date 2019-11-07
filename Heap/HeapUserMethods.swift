//
//  HeapUserMethods.swift
//  Heap
//
//  Created by Maxime De Greve on 06/11/2019.
//  Copyright © 2019 Marvel Prototyping. All rights reserved.
//

public class HeapUserMethods {

    public func update(properties: [String: Any], completion: HeapConnection.Completion?) throws {

        guard Heap.shared.isSetup else {
            throw HeapError.noSetup
        }
        
        guard
            let appId = Heap.shared.appId,
            let identity = Heap.shared.identity else {
            throw HeapError.noAppIdOrIdentity
        }
        
        let event = try HeapAddUserProperties(appId: appId, identity: identity, properties: properties)

        let encodedData = try JSONEncoder().encode(event)

        let connection = HeapConnection(endpoint: .track)
        connection.request.httpBody = encodedData

        try connection.start(completion: completion)

    }

}
