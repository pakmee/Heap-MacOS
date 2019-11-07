//
//  Connection.swift
//  Intercom
//
//  Created by Maxime De Greve on 06/12/2018.
//  Copyright © 2018 Maxime De Greve. All rights reserved.
//

import Foundation

public class HeapConnection {

    public typealias Completion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void
    
    var request: URLRequest
    var session: URLSession

    init(endpoint: HeapEndpoint, urlSession: URLSession = .shared) {

        let url = URL(string: endpoint.url)!

        self.session = urlSession
        self.request = URLRequest(url: url)
        self.request.httpMethod = "POST"
        self.request.addValue("application/json", forHTTPHeaderField: "Accept")
        self.request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    }

    func start(completion:Completion?) throws {
        
        let task = session.dataTask(with: request) {
            (data, response, error) in
            completion?(data, response, error)
        }

        task.resume()
        
    }

}
