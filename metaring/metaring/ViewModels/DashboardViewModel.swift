//
//  DashboardViewModel.swift
//  metaring
//
//  Created by Rinaldi on 22/05/22.
//

import Foundation
import CoreData
import Charts

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
    
    @Published var labelEntries: [String] = []
    @Published var metalContentEntries: [ChartDataEntry] = []
    @Published var waterPHEntries: [ChartDataEntry] = []
    @Published var waterTurbidityEntries: [ChartDataEntry] = []
    @Published var waterDebitEntries: [ChartDataEntry] = []
    
    init() {
        self.date = setupDateNow()
        self.sensor = setupSensor()
        if self.sensor.count != 0 {
            setLastDateDashboard()
//            setDashboardDataEntry()
            groupData(groupBy: "date")
        }
    }
    
    func groupData(groupBy: String) {
        if groupBy == "date" {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat =  "yyyy-MM-dd"
            let dictionary = Dictionary(grouping: self.sensor, by: { (element: SensorModel) in
                return dateFormatter.string(from: element.createTime)
            })
            let last7Days = Date.getDates(forLastNDays: 7)
            var countData = 1
            for day in last7Days {
                var stringDate = ""
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let dateNow = dateFormatter.date(from: day)
                
                dateFormatter.dateFormat = "EE"
                stringDate = dateFormatter.string(from: dateNow!)
                self.labelEntries.append(stringDate)
                
                if (dictionary[day] != nil) {
                    let listDetailDay =  dictionary[day] ?? []
                    let totalDetail = listDetailDay.count
                    
                    var sumMetalContent: Double = 0
                    var sumWaterPH: Double = 0
                    var sumWaterTurbidity: Double = 0
                    var sumWaterDebit: Double = 0
                    
                    for detailDay in listDetailDay {
                        sumMetalContent += detailDay.metalContent
                        sumWaterPH += detailDay.waterPH
                        sumWaterTurbidity += detailDay.waterTurbidity
                        sumWaterDebit += detailDay.waterDebit
                    }
                    
                    self.metalContentEntries.append(
                        ChartDataEntry(x: Double(countData), y: sumMetalContent/Double(totalDetail))
                    )
                    self.waterPHEntries.append(
                        ChartDataEntry(x: Double(countData), y: sumWaterPH/Double(totalDetail))
                    )
                    self.waterTurbidityEntries.append(
                        ChartDataEntry(x: Double(countData), y: sumWaterTurbidity/Double(totalDetail))
                    )
                    self.waterDebitEntries.append(
                        ChartDataEntry(x: Double(countData), y: sumWaterDebit/Double(totalDetail))
                    )
                } else {
                    self.metalContentEntries.append(
                        ChartDataEntry(x: Double(countData), y: Double(0))
                    )
                    self.waterPHEntries.append(
                        ChartDataEntry(x: Double(countData), y: Double(0))
                    )
                    self.waterTurbidityEntries.append(
                        ChartDataEntry(x: Double(countData), y: Double(0))
                    )
                    self.waterDebitEntries.append(
                        ChartDataEntry(x: Double(countData), y: Double(0))
                    )
                }
                countData += 1
            }
        }
    }
    
    func setLastDateDashboard() {
        self.waterDebitValue = self.sensor.last?.waterDebit ??  0
        self.metalContentValue = self.sensor.last?.metalContent ?? 0
        self.waterPHValue = self.sensor.last?.waterPH ?? 0
        self.waterTurbidityValue = self.sensor.last?.waterTurbidity ?? 0
    }
    
    func setDashboardDataEntry() {
        var counter: Double = 0
        for data in self.sensor {
            counter += 1
            self.metalContentEntries.append(
                ChartDataEntry(x: Double(counter), y: data.metalContent)
            )
            
            self.waterPHEntries.append(
                ChartDataEntry(x: Double(counter), y: data.waterPH)
            )

            self.waterTurbidityEntries.append(
                ChartDataEntry(x: Double(counter), y: data.waterTurbidity)
            )

            self.waterDebitEntries.append(
                ChartDataEntry(x: Double(counter), y: data.waterDebit)
            )
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
    
    func format_model_request_value(data: Any) -> Double {
        var result: Double = 0
        guard let data_value = data as? String else {
            return 0
        }
        result = Double(data_value) ?? 0
        return result
    }
    
    func create(model: RequestSensorModel) {
        let sensor = Sensor(context: MetaringCoreDataManager.shared.viewContext)
        sensor.create_time = Date()
        sensor.resource_id = model.ri
        sensor.time = model.ct
        sensor.url = model.pi
        sensor.metal_content = format_model_request_value(data: model.con["metal_content"] as Any)
        sensor.water_turbidity = format_model_request_value(data: model.con["turbidity"] as Any)
        sensor.water_ph = format_model_request_value(data: model.con["ph"] as Any)
        sensor.water_debit = format_model_request_value(data:  model.con["debit"] as Any)
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
