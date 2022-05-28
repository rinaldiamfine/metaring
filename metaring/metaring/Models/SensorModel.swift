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
    var con: Dictionary = Dictionary<String, Any>()
    var ct: String = ""
    var lt: String = ""
    var pi: String = ""
    var ri: String = ""
    var st: Int = 0
    var ty: Int = 0
}

struct SensorModel {
    let sensor: Sensor
    var url: String {
        return sensor.url ?? ""
    }
    var requestId: String {
        return sensor.requestId ?? ""
    }
    var metalContent: Float {
        return sensor.metal_content
    }
    var waterPH: Float {
        return sensor.water_ph
    }
    var waterTurbidity: Float {
        return sensor.water_turbidity
    }
    var waterDebit: Float {
        return sensor.water_debit
    }
    var createTime: Date {
        return sensor.createTime ?? Date()
    }
}
