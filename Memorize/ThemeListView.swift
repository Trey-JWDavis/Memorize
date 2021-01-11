//
//  ThemeListView.swift
//  Memorize
//
//  Created by Trey Davis on 1/4/21.
//

import SwiftUI

struct ThemeListView: View {
    @ObservedObject var themesList: ThemesList
    @State var addingTheme = false
    
    var body: some View {
        NavigationView {
            List(themesList.themes) { theme in
                NavigationLink(
                    destination: EmojiMemoryGameView(viewModel: EmojiMemoryGame(theme: theme)),
                    label: { ThemeRow(theme: theme) }
                )
            }
            .listStyle(PlainListStyle())
            .navigationBarItems(trailing: Button(action: { self.addingTheme.toggle() }) {
                    Image(systemName: "plus")
                }).sheet(isPresented: $addingTheme, content: {
                    AddThemeSheet(themesList: themesList)
                })
            .navigationTitle("Themes")
        }
    }
}

struct ThemeRow: View {
    var theme: Theme
    
    var body: some View {
        HStack {
            Text(theme.name)
                .font(.title)
            Spacer()
            Text(theme.emojis.joined()).font(.body)
        }
    }
}

struct ThemeListView_Previews: PreviewProvider {
    static let previewThemesList = ThemesList()
    static var previews: some View {
        ThemeListView(themesList: previewThemesList)
    }
}
