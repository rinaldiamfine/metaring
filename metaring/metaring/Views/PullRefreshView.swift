//
//  PullRefreshView.swift
//  metaring
//
//  Created by Rinaldi on 12/06/22.
//

import SwiftUI

struct PullRefreshView: View {
    @Binding var isRefreshing: Bool
    var coordinateSpaceName: String
    var onRefresh: ()-> Void
    @State var needRefresh: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            if (geo.frame(in: .named(coordinateSpaceName)).midY > 50) {
                Spacer()
                    .onAppear {
                        needRefresh = true
                    }
            } else if (geo.frame(in: .named(coordinateSpaceName)).maxY < 10) {
                Spacer()
                    .onAppear {
                        if needRefresh {
                            needRefresh = false
                            onRefresh()
                        }
                    }
            }
            HStack {
                Spacer()
                if needRefresh || isRefreshing {
                    ProgressView()
                } else {
//                    Image(systemName: "arrow.clockwise")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 20, height: 20)
//                        .foregroundColor(.gray)
//                    Text("Refresh")
//                        .foregroundColor(.gray)
                }
                Spacer()
            }
        }.padding(.top, isRefreshing ? 0 : -50)
    }
}
