//
//  DashboardViewModel.swift
//  metaring
//
//  Created by Rinaldi on 22/05/22.
//

import Foundation

class DashboardViewModel: ObservableObject {
    @Published var sensor: [SensorModel] = []
    @Published var date: String = ""
    
    init() {
        self.date = setupDateNow()
        self.sensor = setupSensor()
        print(self.sensor, "GET SENSOR")
        AntaresSensorRequest.init(semaphore: DispatchSemaphore(value: 0)).getLastData()
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
