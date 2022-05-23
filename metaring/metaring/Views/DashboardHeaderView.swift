//
//  DashboardHeaderView.swift
//  metaring
//
//  Created by Rinaldi on 21/05/22.
//

import SwiftUI

struct DashboardHeaderView: View {
    @State var date = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hi, There")
                .font(.largeTitle)
                .fontWeight(.medium)
            Text(date)
                .font(.subheadline)
                .foregroundColor(MetaringAssets.subtitleDashboard)
        }
    }
}

struct DashboardHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardHeaderView()
    }
}
