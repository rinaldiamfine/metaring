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
    var domainUrl = "https://platform.antares.id"
    var port = "8443"
    var cseId = "antares-cse"
    var cseName = "antares-id"
    var applicationName = "SmartIdea"
    var deviceName = "SensorTest"
    
    var accessId = "6cd5e5cc78bbed06"
    var accessPassword = "faefeda74389bcb0"
    func setupGetRequest() {
        
    }
    
    func setupFormatResult(stringData: String) -> NSDictionary {
        var result = NSDictionary()
        var dictonary: NSDictionary?
        if let dataJson = stringData.data(using: String.Encoding.utf8) {
            do {
                dictonary = try JSONSerialization.jsonObject(with: dataJson, options: [.allowFragments]) as? [String:AnyObject] as NSDictionary?
                if let dataJsonDictionary = dictonary {
                    result = (dataJsonDictionary["m2m:cin"]! as AnyObject) as! NSDictionary
                }
            } catch let error as NSError {
                print(error)
            }
        }
        return result
    }
    
    func setupFormatSensorResult(sensorData: AnyObject) -> NSDictionary {
        var result = NSDictionary()
        var dictonary: NSDictionary?
//        var stringSensorData = String(sensorData)
        if let dataJson = sensorData.data(using: String.Encoding.utf8.rawValue) {
            do {
                dictonary = try JSONSerialization.jsonObject(with: dataJson, options: [.allowFragments]) as? [String:AnyObject] as NSDictionary?
                if let dataJsonDictionary = dictonary {
                    result = dataJsonDictionary
                }
            } catch let error as NSError {
                print(error)
            }
        }
        return result
    }
    
    func getLastData() -> RequestSensorModel {
        var request = URLRequest(url: URL(string: "\(domainUrl):\(port)/~/\(cseId)/\(cseName)/\(applicationName)/\(deviceName)/la")!, timeoutInterval: Double.infinity)
        request.addValue("\(accessId):\(accessPassword)", forHTTPHeaderField: "X-M2M-Origin")
        request.addValue("application/json;ty=4", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        var requestSensor = RequestSensorModel()
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            let stringData = String(data: data, encoding: .utf8)!
            var formatResult = setupFormatResult(stringData: stringData)
            var formatSensorResult = setupFormatSensorResult(sensorData: formatResult["con"]! as AnyObject)
            requestSensor.con = formatSensorResult as! [String : Any]
            requestSensor.ct = formatResult["ct"] as! String
            requestSensor.lt = formatResult["lt"] as! String
            requestSensor.pi = formatResult["pi"] as! String
            requestSensor.ri = formatResult["ri"] as! String
            requestSensor.st = formatResult["st"] as! Int
            requestSensor.ty = formatResult["ty"] as! Int
            requestSensor.status = true
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        return requestSensor
    }
}
