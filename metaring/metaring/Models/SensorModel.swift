//
//  SensorModel.swift
//  metaring
//
//  Created by Rinaldi on 22/05/22.
//

import Foundation
import CoreData

enum SensorType: String {
    case metal_content, water_ph, water_turbidity, water_debit
}

struct RequestSensorModel {
    var status: Bool = false
    var con: Dictionary = Dictionary<String, Any>() // Content
    var ct: String = "" // Created Time
    var lt: String = "" // Modified Time
    var pi: String = "" // Parent ID
    var ri: String = "" // Resource ID
    var st: Int = 0 //
    var ty: Int = 0 // Type
}

struct SensorModel {
    let sensor: Sensor
    var url: String {
        return sensor.url ?? ""
    }
    var resourceId: String {
        return sensor.resource_id ?? ""
    }
    var metalContent: Double {
        return sensor.metal_content
    }
    var waterPH: Double {
        return sensor.water_ph
    }
    var waterTurbidity: Double {
        return sensor.water_turbidity
    }
    var waterDebit: Double {
        return sensor.water_debit
    }
    var createTime: Date {
        return sensor.create_time ?? Date()
    }
    var time: String {
        return sensor.time ?? ""
    }
}
