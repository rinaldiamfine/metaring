//
//  SensorHelper.swift
//  metaring
//
//  Created by Rinaldi on 22/05/22.
//

import Foundation
import CoreData

extension MetaringCoreDataManager {
    func delete(data: Sensor) {
        viewContext.delete(data)
        save()
    }
    func getAllDataSensor() -> [SensorModel] {
        let request: NSFetchRequest<Sensor> = Sensor.fetchRequest()
        do {
            return try viewContext.fetch(request).map(SensorModel.init).sorted { $0.createTime < $1.createTime }
        } catch {
            return []
        }
    }
    func getDataSensorById(id: NSManagedObjectID) -> Sensor? {
        do {
            return try viewContext.existingObject(with: id) as? Sensor
        } catch {
            return nil
        }
    }
}
