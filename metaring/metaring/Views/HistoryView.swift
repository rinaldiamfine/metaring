//
//  HistoryView.swift
//  metaring
//
//  Created by Rinaldi on 22/05/22.
//

import SwiftUI

struct HistoryView: View {
    @State private var favoriteColor = 0
    
    var body: some View {
        VStack {
            HStack {
                Picker("What is your favorite color?", selection: $favoriteColor) {
                    Text("Day").tag(0)
                    Text("Week").tag(1)
                    Text("Month").tag(2)
                    Text("Year").tag(2)
                }.pickerStyle(.segmented)
            }.padding()
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
