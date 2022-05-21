//
//  DashboardButtonView.swift
//  metaring
//
//  Created by Rinaldi on 21/05/22.
//

import SwiftUI

struct DashboardButtonView: View {
    var value: String = "0.5"
    var unit: String = "Mg/L"
    var name: String = "Metal Content"
    
    var nameIcon: Image = MetaringAssets.metalContentIcon
    var backgroundIcon: Color = MetaringAssets.metalContentBackground
    var nameColor: Color = MetaringAssets.metalContent
    
    var body: some View {
        HStack {
            nameIcon.background(
                RoundedRectangle(cornerRadius: 6.0)
                    .frame(width: 46.94, height: 46.94, alignment: .center)
                    .foregroundColor(backgroundIcon)
                    
            )
            .padding()
            VStack(alignment: .leading, spacing: 5) {
                HStack(alignment: .top) {
                    Text(value)
                        .font(.title)
                    Text(unit)
                        .font(.footnote)
                        .fontWeight(.light)
                        .padding(.vertical, 3)
                }
                Text(name)
                    .foregroundColor(nameColor)
                    .font(.caption)
            }
            Spacer()
        }
        .padding(5)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(MetaringAssets.borderDashboard, lineWidth: 1)
        )
    }
}

struct DashboardButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardButtonView()
    }
}
