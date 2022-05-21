//
//  MultiLineChartView.swift
//  metaring
//
//  Created by Rinaldi on 21/05/22.
//

import SwiftUI
import Charts

struct MultiLineChartView : UIViewRepresentable {
    var entries1 : [ChartDataEntry]
    var entries2 : [ChartDataEntry]
    var entries3 : [ChartDataEntry]
    var entries4 : [ChartDataEntry]
    var days: [String]

    func makeUIView(context: Context) -> LineChartView {
        let chart = LineChartView()
        return createChart(chart: chart)
    }

    func updateUIView(_ uiView: LineChartView, context: Context) {
        uiView.data = addData()
    }

    func createChart(chart: LineChartView) -> LineChartView{
        chart.chartDescription!.enabled = false
        chart.xAxis.drawGridLinesEnabled = true
//        chart.borderLineWidth = 1
        chart.xAxis.drawLabelsEnabled = true
        chart.xAxis.drawAxisLineEnabled = true
        chart.xAxis.labelPosition = .bottom
        chart.leftAxis.labelPosition = .outsideChart
        chart.rightAxis.enabled = false
//        chart.drawBordersEnabled = true
        chart.drawMarkers = true
        chart.legend.form = .none
        chart.xAxis.labelCount = days.count
        chart.xAxis.forceLabelsEnabled = true
        chart.xAxis.granularityEnabled = true
        chart.xAxis.granularity = 0
        chart.xAxis.valueFormatter = CustomChartFormatter(days: days)
        chart.data = addData()
        return chart
    }

    func addData() -> LineChartData{
        let data = LineChartData(dataSets: [
            //Metal Content
            generateLineChartDataSet(dataSetEntries: entries1, color: UIColor(MetaringAssets.metalContent), fillColor: UIColor.clear),
            
            //Water pH
            generateLineChartDataSet(dataSetEntries: entries2, color: UIColor(MetaringAssets.WaterPH), fillColor: UIColor.clear),
            
            //Water Turbidity
            generateLineChartDataSet(dataSetEntries: entries3, color: UIColor(MetaringAssets.WaterTurbidity), fillColor: UIColor.clear),
            
            //Water Debit
            generateLineChartDataSet(dataSetEntries: entries4, color: UIColor(MetaringAssets.waterDebit), fillColor: UIColor.clear)
        ])
        return data
    }

    func generateLineChartDataSet(dataSetEntries: [ChartDataEntry], color: UIColor, fillColor: UIColor) -> LineChartDataSet{
        let dataSet = LineChartDataSet(entries: dataSetEntries, label: "")
        dataSet.colors = [color]
        dataSet.mode = .linear
        dataSet.circleRadius = 1
        dataSet.circleHoleColor = UIColor(Color(#colorLiteral(red: 0.003921568627, green: 0.231372549, blue: 0.431372549, alpha: 1)))
        dataSet.fill = Fill.fillWithColor(fillColor)
        dataSet.drawFilledEnabled = false
        dataSet.setCircleColor(UIColor.clear)
        dataSet.lineWidth = 1.5
        dataSet.valueTextColor = color
        dataSet.valueFont = UIFont(name: UIFont.familyNames.first!, size: 12)!
        return dataSet
    }

}

class CustomChartFormatter: NSObject, IAxisValueFormatter {
    var days: [String]
    init(days: [String]) {
        self.days = days
    }
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return days[Int(value-1)]
    }
}
