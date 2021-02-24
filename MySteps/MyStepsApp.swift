//
//  MyStepsApp.swift
//  MySteps
//
//  Created by Branislav on 27/01/2021.
//

import SwiftUI

@main
struct MyStepsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ProfileView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
