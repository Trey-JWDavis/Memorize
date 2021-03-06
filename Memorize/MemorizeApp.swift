//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Trey Davis on 12/7/20.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let themesList = ThemesList()
            ThemeListView(themesList: themesList)
        }
    }
}
