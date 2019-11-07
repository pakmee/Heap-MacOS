//
//  Heap.swift
//  Marvel Prototyping
//
//  Created by Maxime De Greve on 06/12/2018.
//  Copyright © 2018 Maxime De Greve. All rights reserved.
//

import Foundation

public class Heap {

    public static let shared = Heap()

    var appId: String?
    var identity: String?
    
    public var isSetup: Bool {
        return appId != nil && identity != nil
    }

    public func setup(appId: String, identity: String) {
        self.appId = appId
        self.identity = identity.lowercased()
    }

    public let events = HeapEventsMethods()
    public let user = HeapUserMethods()

}
