//
//  HistoryView.swift
//  metaring
//
//  Created by Rinaldi on 22/05/22.
//

import SwiftUI

struct HistoryView: View {
    @State private var filterBy = 0
    @EnvironmentObject var dashboard: DashboardViewModel
    
    @Binding var metalContentActive: Bool
    @Binding var waterPHActive: Bool
    @Binding var waterTurbidityActive: Bool
    @Binding var waterDebitActive: Bool
    
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
                            isActive: $metalContentActive,
                            name: "Metal Content",
                            nameIcon: MetaringAssets.metalContentIcon,
                            backgroundIcon: MetaringAssets.metalContentBackground,
                            nameColor: MetaringAssets.metalContent
                        ).onTapGesture {
                            self.metalContentActive = true
                            self.waterPHActive = false
                            self.waterTurbidityActive = false
                            self.waterDebitActive = false
                        }
                        
                        DetailButtonView(
                            isActive: $waterPHActive,
                            name: "Water pH",
                            nameIcon: MetaringAssets.waterPHIcon,
                            backgroundIcon: MetaringAssets.WaterPHBackground,
                            nameColor: MetaringAssets.WaterPH
                        ).onTapGesture {
                            self.metalContentActive = false
                            self.waterPHActive = true
                            self.waterTurbidityActive = false
                            self.waterDebitActive = false
                        }
                        
                        DetailButtonView(
                            isActive: $waterTurbidityActive,
                            name: "Water Turbidity",
                            nameIcon: MetaringAssets.waterTurbidityIcon,
                            backgroundIcon: MetaringAssets.WaterTurbidityBackground,
                            nameColor: MetaringAssets.WaterTurbidity
                        ).onTapGesture {
                            self.metalContentActive = false
                            self.waterPHActive = false
                            self.waterTurbidityActive = true
                            self.waterDebitActive = false
                        }
                        
                        DetailButtonView(
                            isActive: $waterDebitActive,
                            name: "Water Debit",
                            nameIcon: MetaringAssets.waterDebitIcon,
                            backgroundIcon: MetaringAssets.WaterDebitBackground,
                            nameColor: MetaringAssets.waterDebit
                        ).onTapGesture {
                            self.metalContentActive = false
                            self.waterPHActive = false
                            self.waterTurbidityActive = false
                            self.waterDebitActive = true
                        }
                    }
                    
                    HStack {
                    }
                    .frame(width: geometry.self.size.width, height: 10)
                    .background(Color.clear)
                    
                    HStack {
                        Picker("Filter", selection: $filterBy) {
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

//struct HistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryView()
//    }
//}
