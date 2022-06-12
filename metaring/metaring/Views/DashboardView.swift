//
//  DashboardView.swift
//  metaring
//
//  Created by Rinaldi on 21/05/22.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var dashboard: DashboardViewModel
    @State var isDetailOpened: Bool = false
    @State var isRefreshing: Bool = false
    
    func fetchOrders() {
        self.isRefreshing = true
        dashboard.getLastDataSensor()
        self.isRefreshing = false
    }
    
    var body: some View {
        NavigationView {
            GeometryReader(content: { geometry in
                ScrollView {
                    PullRefreshView(isRefreshing: $isRefreshing, coordinateSpaceName: "pullToRefresh") {
                        fetchOrders()
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        // HEADER CONTENT
                        HStack {
                            DashboardHeaderView(date: dashboard.date)
                            Spacer()
                        }
                        .padding()
                        .background(MetaringAssets.groupBackgroundColor)
                        
                        // BUTTON CONTENT
                        HStack {
                            VStack {
                                HStack {
                                    NavigationLink(destination: HistoryView().environmentObject(dashboard), isActive: $isDetailOpened) {
                                        DashboardButtonView(
                                            value: String(dashboard.metalContentValue),
                                            unit: dashboard.metalContentType,
                                            name: "Metal Content",
                                            nameIcon: MetaringAssets.metalContentIcon,
                                            backgroundIcon: MetaringAssets.metalContentBackground,
                                            nameColor: MetaringAssets.metalContent
                                        )
                                    }
                                    
                                    
                                    NavigationLink(destination: HistoryView().environmentObject(dashboard), isActive: $isDetailOpened) {
                                        DashboardButtonView(
                                            value: String(dashboard.waterPHValue),
                                            unit: dashboard.waterPHType,
                                            name: "Water pH",
                                            nameIcon: MetaringAssets.waterPHIcon,
                                            backgroundIcon: MetaringAssets.WaterPHBackground,
                                            nameColor: MetaringAssets.WaterPH
                                        )
                                    }
                                }
                                HStack {
                                    NavigationLink(destination: HistoryView().environmentObject(dashboard), isActive: $isDetailOpened) {
                                        DashboardButtonView(
                                            value: String(dashboard.waterTurbidityValue),
                                            unit: dashboard.waterTurbidityType,
                                            name: "Water Turbidity",
                                            nameIcon: MetaringAssets.waterTurbidityIcon,
                                            backgroundIcon: MetaringAssets.WaterTurbidityBackground,
                                            nameColor: MetaringAssets.WaterTurbidity
                                        )
                                    }
                                    
                                    NavigationLink(destination: HistoryView().environmentObject(dashboard), isActive: $isDetailOpened) {
                                        DashboardButtonView(
                                            value: String(dashboard.waterDebitValue),
                                            unit: dashboard.waterDebitType,
                                            name: "Water Debit",
                                            nameIcon: MetaringAssets.waterDebitIcon,
                                            backgroundIcon: MetaringAssets.WaterDebitBackground,
                                            nameColor: MetaringAssets.waterDebit
                                        )
                                    }
                                }
                            }
                        }
                        .padding()
                        .background(MetaringAssets.groupBackgroundColor)
                        
                        HStack {
                        }
                        .frame(width: geometry.self.size.width, height: 10)
                        .background(Color.clear)
                        // BUTTON CONTENT
                        HStack {
                            DashboardChartView()
                                .frame(height: 370)
                        }
                        .padding(5)
                        .background(MetaringAssets.groupBackgroundColor)
                        
                    }
                    .background(MetaringAssets.mainBackgroundColor)
//                    .navigationTitle("Dashboard")
                    .navigationBarTitleDisplayMode(.inline)
                }.coordinateSpace(name: "pullToRefresh")
            })
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
