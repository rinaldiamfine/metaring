//
//  TabBarView.swift
//  metaring
//
//  Created by Rinaldi on 22/05/22.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 1
    @ObservedObject var dashboard: DashboardViewModel = DashboardViewModel()
    var body: some View {
        TabView(selection: $selectedTab) {
            DashboardView().tabItem {
                if selectedTab == 1 {
                    MetaringAssets.dashboardIconActive
                } else {
                    MetaringAssets.dashboardIcon
                }
                Text("Dashboard")
            }.tag(1)
                .environmentObject(dashboard)
            
//            HistoryView().tabItem {
//                if selectedTab == 2 {
//                    MetaringAssets.historyIconActive
//                } else {
//                    MetaringAssets.historyIcon
//                }
//                Text("History")
//            }.tag(2)
//                .environmentObject(dashboard)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
