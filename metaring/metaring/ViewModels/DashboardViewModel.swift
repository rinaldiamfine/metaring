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
    @Published var detailSelected = 0
    
    @Published var metalContentValue: Double = 0.0
    @Published var metalContentType: String = "Mg/L"
    
    @Published var waterPHValue: Double = 0.0
    @Published var waterPHType: String = "pH"
    
    @Published var waterTurbidityValue: Double = 0.0
    @Published var waterTurbidityType: String = "NTU"
    
    @Published var waterDebitValue: Double = 0.0
    @Published var waterDebitType: String = "m3/s"
    
    @Published var requestSensor: [RequestSensorModel] = []
    
    init() {
        self.date = setupDateNow()
        self.sensor = setupSensor()
        print(self.sensor.count)
        if self.sensor.count != 0 {
            print("LETS GO FILL")
        }
    }
    
    func getLastDataSensor() {
        let requestModel: RequestSensorModel = AntaresSensorRequest.init(semaphore: DispatchSemaphore(value: 0)).getLastData()
        if  requestModel.status {
            create(model: requestModel)
        }
    }
    
    func fetch() {
        self.sensor = MetaringCoreDataManager.shared.getAllDataSensor()
    }
    
    func create(model: RequestSensorModel) {
        let sensor = Sensor(context: MetaringCoreDataManager.shared.viewContext)
        sensor.create_time = Date()
        sensor.resource_id = model.ri
        sensor.time = model.ct
        sensor.url = model.pi
        sensor.metal_content = model.con["metal_content"] as? Double ?? 0
        sensor.water_turbidity = model.con["turbidity"] as? Double ?? 0
        sensor.water_ph = model.con["ph"] as? Double ?? 0
        sensor.water_debit = model.con["debit"] as? Double ?? 0
        MetaringCoreDataManager.shared.save()
        fetch()
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
