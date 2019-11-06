//
//  HeapErrors.swift
//  Heap
//
//  Created by Maxime De Greve on 06/11/2019.
//  Copyright © 2019 Marvel Prototyping. All rights reserved.
//

import Foundation

enum HeapError: String, Error {
    case noSetup = "⛑ HEAP: Before using this method first use method: Heap.setup(appId: String, identity: String)"
    case invalidProperties = "⛑ HEAP: The properties supplied aren't in the right format."
    case noAppIdOrIdentity = "⛑ HEAP: No app id or identity set. Did you use the setup method correctly?."
    case decodingFailed = "⛑ HEAP: Let the developer know about this error."
}
