//
//  DetailButtonView.swift
//  metaring
//
//  Created by Rinaldi on 11/06/22.
//

import SwiftUI

struct DetailButtonView: View {
    @Binding var isActive: Bool
    var name: String = "Metal Content"
    
    var nameIcon: Image = MetaringAssets.metalContentIcon
    var backgroundIcon: Color = MetaringAssets.metalContentBackground
    var nameColor: Color = MetaringAssets.metalContent
    
    var body: some View {
        VStack {
            HStack {
                nameIcon.background(
                    RoundedRectangle(cornerRadius: 6.0)
                        .frame(width: 46.94, height: 46.94, alignment: .center)
                        .foregroundColor(backgroundIcon)
                        
                )
                .padding()
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(MetaringAssets.borderDashboard, lineWidth: 1)
            )
            Text(name)
                .foregroundColor(nameColor)
                .font(.caption)
                .multilineTextAlignment(.center)
            Spacer()
            if isActive {
                RoundedRectangle(cornerRadius: 10, style: .circular)
                    .frame(width: 20, height: 4, alignment: .center)
                    .foregroundColor(.blue)
            }
        }.padding(.horizontal)
    }
}

//struct DetailButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailButtonView()
//    }
//}
