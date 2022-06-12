//
//  DashboardChartView.swift
//  metaring
//
//  Created by Rinaldi on 21/05/22.
//

import SwiftUI
import Charts

struct DashboardChartView: View {
    let labels = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    let entries1 = [
        ChartDataEntry(x: 1, y: 1),
        ChartDataEntry(x: 2, y: 2),
        ChartDataEntry(x: 3, y: 3),
        ChartDataEntry(x: 4, y: 5),
        ChartDataEntry(x: 5, y: 2),
        ChartDataEntry(x: 6, y: 1),
        ChartDataEntry(x: 7, y: 3)
        
    ]
    let entries2 = [
        ChartDataEntry(x: 1, y: 2),
        ChartDataEntry(x: 2, y: 3),
        ChartDataEntry(x: 3, y: 1),
        ChartDataEntry(x: 4, y: 4),
        ChartDataEntry(x: 5, y: 2),
        ChartDataEntry(x: 6, y: 3),
        ChartDataEntry(x: 7, y: 2)
    ]
    let entries3 = [
        ChartDataEntry(x: 1, y: 2),
        ChartDataEntry(x: 2, y: 3),
        ChartDataEntry(x: 3, y: 2),
        ChartDataEntry(x: 4, y: 4),
        ChartDataEntry(x: 5, y: 5),
        ChartDataEntry(x: 6, y: 3),
        ChartDataEntry(x: 7, y: 1)
        
    ]
    let entries4 = [
        ChartDataEntry(x: 1, y: 3),
        ChartDataEntry(x: 2, y: 1),
        ChartDataEntry(x: 3, y: 2),
        ChartDataEntry(x: 4, y: 1),
        ChartDataEntry(x: 5, y: 3),
        ChartDataEntry(x: 6, y: 2),
        ChartDataEntry(x: 7, y: 1),
    ]
    
    var body: some View {
        VStack {
            MultiLineChartView(
                entries1: entries1,
                entries2: entries2,
                entries3: entries3,
                entries4: entries4,
                labels: labels)
        }
    }
}

struct DashboardChartView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardChartView()
    }
}
