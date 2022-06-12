//
//  DashboardViewModel.swift
//  metaring
//
//  Created by Rinaldi on 22/05/22.
//

import Foundation
import CoreData

class DashboardViewModel: ObservableObject {
    @Published var sensor: [SensorModel] = []
    @Published var date: String = ""
    
    @Published var metalContentValue: Float = 0.0
    @Published var metalContentType: String = "Mg/L"
    
    @Published var waterPHValue: Float = 0.0
    @Published var waterPHType: String = "pH"
    
    @Published var waterTurbidityValue: Float = 0.0
    @Published var waterTurbidityType: String = "NTU"
    
    @Published var waterDebitValue: Float = 0.0
    @Published var waterDebitType: String = "m3/s"
    
    @Published var requestSensor: [RequestSensorModel] = []
    
    init() {
        self.date = setupDateNow()
        self.sensor = setupSensor()
        if self.sensor.count != 0 {
            print("LETS GO FILL")
        }
    }
    
    func getLastData() {
        var antaresRequest: RequestSensorModel = AntaresSensorRequest.init(semaphore: DispatchSemaphore(value: 0)).getLastData()
        print(antaresRequest, "ANTARES REQ")
    }
    
    func setupDateNow() -> String {
        var stringDate = ""
        let dateNow = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE, dd MMM y"
        stringDate = dateFormatter.string(from: dateNow)
        return stringDate
    }
    
    func setupSensor() -> Array<SensorModel> {
        return MetaringCoreDataManager.shared.getAllDataSensor()
    }
}
