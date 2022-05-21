//
//  DashboardHeaderView.swift
//  metaring
//
//  Created by Rinaldi on 21/05/22.
//

import SwiftUI

struct DashboardHeaderView: View {
    func setupDateNow() -> String {
        var stringDate = ""
        let dateNow = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE, dd MMM y"
        stringDate = dateFormatter.string(from: dateNow)
        return stringDate
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hi, There")
                .font(.largeTitle)
                .fontWeight(.medium)
            Text(setupDateNow())
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
