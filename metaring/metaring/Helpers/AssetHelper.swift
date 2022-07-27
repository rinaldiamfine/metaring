//
//  AssetHelper.swift
//  metaring
//
//  Created by Rinaldi on 21/05/22.
//

import Foundation
import SwiftUI

struct MetaringAssets {
    static var dashboardIcon = Image("DashboardIcon")
    static var fontColor = Color("FontColor")
    static var dashboardIconActive = Image("DashboardIconActive")
    static var historyIcon = Image("HistoryIcon")
    static var historyIconActive = Image(("HistoryIconActive"))
    
    static var subtitleDashboard = Color("SubtitleDashboard")
    static var borderDashboard = Color("BorderDashboard")
    static var mainBackgroundColor = Color("MainBackgroundColor")
    static var groupBackgroundColor = Color("GroupBackgroundColor")
    
    static var metalContent = Color("MetalContent")
    static var metalContentBackground = Color("MetalContentBackground")
    static var metalContentIcon = Image("MetalContentIcon")
    
    static var waterDebit = Color("WaterDebit")
    static var WaterDebitBackground = Color("WaterDebitBackground")
    static var waterDebitIcon = Image("WaterDebitIcon")
    
    static var WaterPH = Color("WaterPH")
    static var WaterPHBackground = Color("WaterPHBackground")
    static var waterPHIcon = Image("WaterPHIcon")
    
    static var WaterTurbidity = Color("WaterTurbidity")
    static var WaterTurbidityBackground = Color("WaterTurbidityBackground")
    static var waterTurbidityIcon = Image("WaterTurbidityIcon")
}

struct MetaringGraphType {
    static var hours = ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"]
    static var weeks = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    static var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
}

extension Date {
    static func getDates(forLastNDays nDays: Int) -> [String] {
        let cal = NSCalendar.current
        var date = cal.startOfDay(for: Date())
        date = cal.date(byAdding: Calendar.Component.day, value: 1, to: date)!
        var arrDates = [String]()
        for _ in 1 ... nDays {
            date = cal.date(byAdding: Calendar.Component.day, value: -1, to: date)!
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateString = dateFormatter.string(from: date)
            arrDates.append(dateString)
        }
        return arrDates.reversed()
    }
    
    static func getDayNames(dateString: String) -> String {
        var dayName = ""
        let dateString = "2018-12-24"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: dateString) else {
            return ""
        }

        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: date)
        formatter.dateFormat = "MM"
        let month = formatter.string(from: date)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: date)
        print(year, month, day) // 2018 12 24
        
        return dayName
    }
}
