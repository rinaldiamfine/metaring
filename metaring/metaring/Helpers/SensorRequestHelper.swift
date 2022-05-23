//
//  SensorRequestHelper.swift
//  metaring
//
//  Created by Rinaldi on 22/05/22.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

struct AntaresSensorRequest {
    var semaphore = DispatchSemaphore (value: 0)
    func setupGetRequest() {
        
    }
    
    func getLastData() {
        var request = URLRequest(url: URL(string: "https://platform.antares.id:8443/~/antares-cse/antares-id/SmartIdea/SensorTest/la")!, timeoutInterval: Double.infinity)
        
        request.addValue("6cd5e5cc78bbed06:faefeda74389bcb0", forHTTPHeaderField: "X-M2M-Origin")
        request.addValue("application/json;ty=4", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
}
