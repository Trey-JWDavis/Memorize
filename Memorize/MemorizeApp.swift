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
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
        }
    }
}
