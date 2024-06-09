//
//  Scoreboard.swift
//  ReflexGamz
//
//  Created by SEUNGBIN LEE on 6/3/24.
//

import SwiftUI

struct Player: Identifiable {
    let id = UUID()
    let name: String
    let score: Int
}

struct ScoreboardView: View {
    // Sample data for the leaderboard
    @State private var players = [
        Player(name: "sample", score: 1500),
        Player(name: "sample2", score: 1200),
        Player(name: "sample3", score: 900),
        Player(name: "sample4", score:0)
    ]
    
    var body: some View {
        
        ZStack {
            // Background Color
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                // Logo
                Image("ScoreBoardIcon")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .padding(.top, 50)
                    .padding(.leading, 20)
                
                // Title
                Text("Leaderboard")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.leading, 20)
                
                Spacer()
                    .frame(height: 20)
                
                // Leaderboard List
                List(players.sorted(by: { $0.score > $1.score }).prefix(10).enumerated().map { $0.element }) { player in
                    HStack {
                        // Ranking Emoji
                        if let index = players.firstIndex(where: { $0.id == player.id }), index < 3 {
                            let rankingEmojis = ["🥇", "🥈", "🥉"]
                            Text(rankingEmojis[index])
                                .font(.headline)
                        }
                        
                        Text(player.name)
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                        Text("\(player.score)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 10)
                    .listRowBackground(Color.black)
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal, 20)
            }
        }
    }
}

struct ScoreboardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreboardView()
    }
}
