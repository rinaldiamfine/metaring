//
//  HistoryView.swift
//  metaring
//
//  Created by Rinaldi on 22/05/22.
//

import SwiftUI

struct HistoryView: View {
    @State private var favoriteColor = 0
    @EnvironmentObject var dashboard: DashboardViewModel
//    @Binding var isOpened: Bool
    
    var body: some View {
        GeometryReader(content: { geometry in
            ScrollView {
                VStack {
                    HStack {
                    }
                    .frame(width: geometry.self.size.width, height: 10)
                    .background(Color.clear)
                    
                    HStack {
                        DetailButtonView(
                            value: String(dashboard.metalContentValue),
                            unit: dashboard.metalContentType,
                            name: "Metal Content",
                            nameIcon: MetaringAssets.metalContentIcon,
                            backgroundIcon: MetaringAssets.metalContentBackground,
                            nameColor: MetaringAssets.metalContent
                        )
                        DetailButtonView(
                            value: String(dashboard.waterPHValue),
                            unit: dashboard.waterPHType,
                            name: "Water pH",
                            nameIcon: MetaringAssets.waterPHIcon,
                            backgroundIcon: MetaringAssets.WaterPHBackground,
                            nameColor: MetaringAssets.WaterPH
                        )
                        DetailButtonView(
                            value: String(dashboard.waterTurbidityValue),
                            unit: dashboard.waterTurbidityType,
                            name: "Water Turbidity",
                            nameIcon: MetaringAssets.waterTurbidityIcon,
                            backgroundIcon: MetaringAssets.WaterTurbidityBackground,
                            nameColor: MetaringAssets.WaterTurbidity
                        )
                        DetailButtonView(
                            value: String(dashboard.waterDebitValue),
                            unit: dashboard.waterDebitType,
                            name: "Water Debit",
                            nameIcon: MetaringAssets.waterDebitIcon,
                            backgroundIcon: MetaringAssets.WaterDebitBackground,
                            nameColor: MetaringAssets.waterDebit
                        )
                    }
                    
                    HStack {
                    }
                    .frame(width: geometry.self.size.width, height: 10)
                    .background(Color.clear)
                    
                    HStack {
                        Picker("Filter", selection: $favoriteColor) {
                            Text("Day").tag(0)
                            Text("Week").tag(1)
                            Text("Month").tag(2)
                            Text("Year").tag(2)
                        }.pickerStyle(.segmented)
                    }.padding()
                    Spacer()
                }
                .navigationTitle("History")
            .navigationBarTitleDisplayMode(.inline)
            }
        })
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
