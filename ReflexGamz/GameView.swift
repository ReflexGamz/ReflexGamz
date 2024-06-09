//
//  GameView.swift
//  ReflexGamz
//
//  Created by Ruben Movsisyan on 6/4/24.
//

import SwiftUI

struct GameView: View {
    let symbols = Array(repeating: "⭐️", count: 30)
    @State private var visibleSymbolIndex = Int.random(in: 0..<30)
    @State private var countdown: Int = 60
    @State private var score: Int = 0
    @State private var symbolTimer: Timer?
    @State private var countdownTimer: Timer?
    let duration: TimeInterval = 60
    let interval: TimeInterval = 2 // Change the number according to the difficulty
    let countdownInterval: TimeInterval = 1
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea() // Change according to theme
            VStack {
                GeometryReader { geometry in
                    VStack {
                        HStack {
                            Text("\(self.countdown)")
                                .font(.largeTitle)
                                .padding()
                                .cornerRadius(10)
                                .padding(.top, 20)
                                .padding(.leading, 20)
                            
                            Spacer()
                            
                            Text("Score: \(self.score)")
                                .font(.largeTitle)
                                .padding()
                                .cornerRadius(10)
                                .padding(.top, 20)
                                .padding(.trailing, 20)
                        }
                        
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(0..<symbols.count, id: \.self) { index in
                                Text(self.symbols[index])
                                    .font(.system(size: 30))
                                    .foregroundColor(.blue)
                                    .opacity(index == self.visibleSymbolIndex ? 1.0 : 0.0)
                                    .scaleEffect(index == self.visibleSymbolIndex ? 1.5 : 0.0)
                                    .animation(.easeInOut(duration: 0.5))
                                    .transition(.scale)
                                    .onTapGesture {
                                        if index == self.visibleSymbolIndex {
                                            self.score += 1
                                            self.visibleSymbolIndex = Int.random(in: 0..<self.symbols.count)
                                        }
                                    }
                            }
                        }
                        .padding()
                        .frame(width: geometry.size.width * 0.8)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    self.resetGame()
                }) {
                    Text("New Game")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                }
            }
            .onAppear {
                self.startGame()
            }
        }
    }
    
    private func startGame() {
        self.symbolTimer = Timer.scheduledTimer(withTimeInterval: self.interval, repeats: true) { _ in
            self.visibleSymbolIndex = Int.random(in: 0..<self.symbols.count)
        }
        
        self.countdownTimer = Timer.scheduledTimer(withTimeInterval: self.countdownInterval, repeats: true) { _ in
            if self.countdown > 0 {
                self.countdown -= 1
            } else {
                self.countdownTimer?.invalidate()
                // Show end game screen
            }
        }
    }
    
    private func resetGame() {
        self.countdown = 60
        self.score = 0
        self.visibleSymbolIndex = Int.random(in: 0..<self.symbols.count)
        self.symbolTimer?.invalidate()
        self.countdownTimer?.invalidate()
        self.startGame()
    }
}

#Preview {
    GameView()
}
