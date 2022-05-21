//
//  MultiLineChartView.swift
//  metaring
//
//  Created by Rinaldi on 21/05/22.
//

import SwiftUI
//import Charts

//struct MultiLineChartView : UIViewRepresentable {
//    var entries1 : [ChartDataEntry]
//    var entries2 : [ChartDataEntry]
//    var days: [String]
//
//    func makeUIView(context: Context) -> LineChartView {
//        let chart = LineChartView()
//        return createChart(chart: chart)
//    }
//
//    func updateUIView(_ uiView: LineChartView, context: Context) {
//        uiView.data = addData()
//    }
//
//    func createChart(chart: LineChartView) -> LineChartView{
//        chart.chartDescription.enabled = false
//        chart.xAxis.drawGridLinesEnabled = false
//        chart.xAxis.drawLabelsEnabled = true
//        chart.xAxis.drawAxisLineEnabled = false
//        chart.xAxis.labelPosition = .bottom
//        chart.rightAxis.enabled = false
//        chart.leftAxis.enabled = false
//        chart.drawBordersEnabled = false
//        chart.legend.form = .none
//        chart.xAxis.labelCount = 7
//        chart.xAxis.forceLabelsEnabled = true
//        chart.xAxis.granularityEnabled = true
//        chart.xAxis.granularity = 1
//        chart.xAxis.valueFormatter = CustomChartFormatter(days: days) as? AxisValueFormatter
//
//        chart.data = addData()
//        return chart
//    }
//
//    func addData() -> LineChartData{
//        let data = LineChartData(dataSets: [
//            //Schedule Trips Line
//            generateLineChartDataSet(dataSetEntries: entries1, color: UIColor(Color(#colorLiteral(red: 0.6235294118, green: 0.7333333333, blue: 0.3568627451, alpha: 1))), fillColor: UIColor(Color(#colorLiteral(red: 0, green: 0.8134518862, blue: 0.9959517121, alpha: 1)))),
//            //Unloadings Line
//            generateLineChartDataSet(dataSetEntries: entries2, color: UIColor(Color(#colorLiteral(red: 0.003921568627, green: 0.231372549, blue: 0.431372549, alpha: 1))), fillColor: UIColor(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))))
//        ])
//        return data
//    }
//
//    func generateLineChartDataSet(dataSetEntries: [ChartDataEntry], color: UIColor, fillColor: UIColor) -> LineChartDataSet{
//        let dataSet = LineChartDataSet(entries: dataSetEntries, label: "")
//        dataSet.colors = [color]
//        dataSet.mode = .cubicBezier
//        dataSet.circleRadius = 5
//        dataSet.circleHoleColor = UIColor(Color(#colorLiteral(red: 0.003921568627, green: 0.231372549, blue: 0.431372549, alpha: 1)))
//        dataSet.fill = Fill.fillWithColor(fillColor)
//        dataSet.drawFilledEnabled = true
//        dataSet.setCircleColor(UIColor.clear)
//        dataSet.lineWidth = 2
//        dataSet.valueTextColor = color
//        dataSet.valueFont = UIFont(name: "Avenir", size: 12)!
//        return dataSet
//    }
//
//}
//
//class CustomChartFormatter: NSObject, IAxisValueFormatter {
//    var days: [String]
//    init(days: [String]) {
//        self.days = days
//    }
//
//    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
//        return days[Int(value-1)]
//    }
//}
