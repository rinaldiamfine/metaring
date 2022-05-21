//
//  metaringApp.swift
//  metaring
//
//  Created by Rinaldi on 21/05/22.
//

import SwiftUI

@main
struct metaringApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            DashboardView()
//            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
