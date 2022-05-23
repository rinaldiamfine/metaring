//
//  metaringApp.swift
//  metaring
//
//  Created by Rinaldi on 21/05/22.
//

import SwiftUI

@main
struct metaringApp: App {
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
                case .active:
                    print("active")
                case .inactive:
                    print("inactive")
                case .background:
                    print("background")
                @unknown default:
                    print("unknown")
            }
        }
    }
}
