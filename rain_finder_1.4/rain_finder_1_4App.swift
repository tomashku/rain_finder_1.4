//
//  rain_finder_1_4App.swift
//  rain_finder_1.4
//
//  Created by Tomasz Zuczek on 26/06/2022.
//

import SwiftUI

@main
struct rain_finder_1_4App: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }    }
}
