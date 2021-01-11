//
//  AddThemeSheet.swift
//  Memorize
//
//  Created by Trey Davis on 1/5/21.
//

import SwiftUI

struct AddThemeSheet: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var themesList: ThemesList
    
    @State private var name: String = ""
    @State private var emojis: String = ""
    @State private var cards: String = ""
    @State private var color: Color = .white
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Text("Theme title:")
                    Spacer()
                    TextField("E.g. Faces", text: $name)
                }
                    .padding()
                    .frame(height: 50, alignment: .leading)
                Divider()
                HStack {
                    Text("Emojis:")
                    Spacer()
                    TextField("Enter emojis here...", text: $emojis)
                }
                    .padding()
                    .frame(height: 50, alignment: .leading)
                Divider()
                // TODO: - Make sure cards shown is <= total emojis
                HStack {
                    Text("Cards shown (optional) :")
                    Spacer()
                    TextField("100", text: $cards)
                        .frame(width: 150, alignment: .trailing)
                }
                    .padding()
                    .frame(height: 50, alignment: .leading)
                Divider()
                ColorPicker("Select a color from wheel:", selection: $color, supportsOpacity: false).padding()
                Spacer()
                HStack {
                    Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                        Text("Cancel")
                    }
                        .font(.subheadline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(.darkGray))
                        .clipShape(Capsule())
                    Spacer()
                    Button(action: {
                        let intCards = Int(cards) ?? nil
                        let id = themesList.themes.count + 1
                        let emojiArray = Array(emojis).map { String($0) }
                        themesList.themes.append(Theme(name: name, emojis: emojiArray, cards: intCards, color: color, id: id))
                        print(themesList.themes)
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Create Theme")
                    }
                        .font(.subheadline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(.blue))
                        .clipShape(Capsule())
                }
                .padding(.horizontal)
            }
        }
    }
}

struct AddThemeSheet_Previews: PreviewProvider {
    static let previewThemeList = ThemesList()
    static var previews: some View {
        AddThemeSheet(themesList: previewThemeList)
    }
}
