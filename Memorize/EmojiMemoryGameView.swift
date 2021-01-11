//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Trey Davis on 12/7/20.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                withAnimation(Animation.linear(duration: 0.6)){
                    viewModel.choose(card: card)
                }
            }.padding(5)
        }
            .padding()
            .foregroundColor(viewModel.theme.color)
            .navigationBarTitle(Text("\(viewModel.score)"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: { withAnimation(.easeInOut){ viewModel.createNewGame() }}) {
                Text("New Game")
            })
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90), clockwise: true)
                            
                            .onAppear() {
                                startBonusTimeAnimation()
                            }
                    } else {
                        Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90), clockwise: true)
                    }
                }
                .padding(5)
                .opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func fontSize(for size: CGSize) -> CGFloat {
        return min(size.width, size.height) * 0.70
    }
}

struct ContentView_Previews: PreviewProvider {
    static let previewTheme = Theme(name: "Faces", emojis: ["☺️","😂","😅","🤣","😌","😝","😋","🥰","😍"], cards: 5, color: .yellow, id: 0)
    static var previews: some View {
        let game = EmojiMemoryGame(theme: previewTheme)
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
