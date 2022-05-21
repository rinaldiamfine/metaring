//
//  DashboardView.swift
//  metaring
//
//  Created by Rinaldi on 21/05/22.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
//        NavigationView {
            GeometryReader(content: { geometry in
                VStack(alignment: .leading, spacing: 20) {
                    // HEADER CONTENT
                    HStack {
                        DashboardHeaderView()
                    }
                    
                    // BUTTON CONTENT
                    HStack {
                        VStack(spacing: 10) {
                            HStack {
                                DashboardButtonView(
                                    value: "0.5",
                                    unit: "Mg/L",
                                    name: "Metal Content",
                                    nameIcon: MetaringAssets.metalContentIcon,
                                    backgroundIcon: MetaringAssets.metalContentBackground,
                                    nameColor: MetaringAssets.metalContent
                                )
                                DashboardButtonView(
                                    value: "7",
                                    unit: "pH",
                                    name: "Water pH",
                                    nameIcon: MetaringAssets.waterPHIcon,
                                    backgroundIcon: MetaringAssets.WaterPHBackground,
                                    nameColor: MetaringAssets.WaterPH
                                )
                            }
                            HStack {
                                DashboardButtonView(
                                    value: "0.5",
                                    unit: "NTU",
                                    name: "Water Turbidity",
                                    nameIcon: MetaringAssets.waterTurbidityIcon,
                                    backgroundIcon: MetaringAssets.WaterTurbidityBackground,
                                    nameColor: MetaringAssets.WaterTurbidity
                                )
                                DashboardButtonView(
                                    value: "0.5",
                                    unit: "m3/s",
                                    name: "Water Debit",
                                    nameIcon: MetaringAssets.waterDebitIcon,
                                    backgroundIcon: MetaringAssets.WaterDebitBackground,
                                    nameColor: MetaringAssets.waterDebit
                                )
                            }
                        }
                    }
                }.padding()
            }
            )
//        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
