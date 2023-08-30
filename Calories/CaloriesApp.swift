//
//  CaloriesApp.swift
//  Calories
//
//  Created by Hayk Sakulyan on 23.08.23.
//

import SwiftUI

@main
struct CaloriesApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
