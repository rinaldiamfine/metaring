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
    static var weeks = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    static var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
}
