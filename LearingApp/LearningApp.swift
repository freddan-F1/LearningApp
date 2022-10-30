//
//  LearningApp.swift
//  LearningApp
//
//  Created by Fredrik Nilsson on 2022-10-30.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
