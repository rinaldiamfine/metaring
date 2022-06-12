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
    
    @State var metalContentActive: Bool = false
    @State var waterPHActive: Bool = false
    @State var waterTurbidityActive: Bool = false
    @State var waterDebitActive: Bool = false
    
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
                                    Button {
                                        metalContentActive = true
                                        waterPHActive = false
                                        waterTurbidityActive = false
                                        waterDebitActive = false
                                        isDetailOpened = true
                                    } label: {
                                        DashboardButtonView(
                                            value: String(dashboard.metalContentValue),
                                            unit: dashboard.metalContentType,
                                            name: "Metal Content",
                                            nameIcon: MetaringAssets.metalContentIcon,
                                            backgroundIcon: MetaringAssets.metalContentBackground,
                                            nameColor: MetaringAssets.metalContent
                                        )
                                    }
                                    
                                    Button {
                                        metalContentActive = false
                                        waterPHActive = true
                                        waterTurbidityActive = false
                                        waterDebitActive = false
                                        isDetailOpened = true
                                    } label: {
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
                                    Button {
                                        metalContentActive = false
                                        waterPHActive = false
                                        waterTurbidityActive = true
                                        waterDebitActive = false
                                        isDetailOpened = true
                                    } label: {
                                        DashboardButtonView(
                                            value: String(dashboard.waterTurbidityValue),
                                            unit: dashboard.waterTurbidityType,
                                            name: "Water Turbidity",
                                            nameIcon: MetaringAssets.waterTurbidityIcon,
                                            backgroundIcon: MetaringAssets.WaterTurbidityBackground,
                                            nameColor: MetaringAssets.WaterTurbidity
                                        )
                                    }
                                    
                                    Button {
                                        metalContentActive = false
                                        waterPHActive = false
                                        waterTurbidityActive = false
                                        waterDebitActive = true
                                        isDetailOpened = true
                                    } label: {
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
                }
                .background(
                    NavigationLink(
                        destination: HistoryView(
                            metalContentActive: $metalContentActive,
                            waterPHActive: $waterPHActive,
                            waterTurbidityActive: $waterTurbidityActive,
                            waterDebitActive: $waterDebitActive).environmentObject(dashboard),
                        isActive: $isDetailOpened) {
                            EmptyView()
                    }
                )
                .coordinateSpace(name: "pullToRefresh")
            })
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
