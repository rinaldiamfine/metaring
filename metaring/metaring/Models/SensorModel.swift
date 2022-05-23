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

struct SensorModel {
    let sensor: Sensor
    var url: String {
        return sensor.url ?? ""
    }
    var requestId: String {
        return sensor.requestId ?? ""
    }
    var sensorType: String {
        //metal_content
        //water_ph
        //water_turbidity
        //water_debit
        return sensor.sensorType ?? ""
    }
    var unit: String {
        return sensor.unit ?? ""
    }
    var value: Float {
        return sensor.value
    }
    var createTime: Date {
        return sensor.createTime ?? Date()
    }
}
