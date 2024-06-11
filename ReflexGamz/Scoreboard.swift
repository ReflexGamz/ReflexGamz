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
        Player(name: "Untitled", score: 0),
        Player(name: "Untitled", score: 0),
        Player(name: "Untitled", score: 0),
    ]
    
    var body: some View {
        
        ZStack{
            // Background Color
            Color("BGColor")
                .ignoresSafeArea()
            GeometryReader { geometry in
                VStack(spacing: 20) {
                    // Logo
                    Image(systemName: "trophy.fill")
                        .resizable()
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.yellow)
                    
                    // Title
                    Text("Scoreboard")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
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
                        .listRowBackground(Color("BGColor"))
                    }
                    .listStyle(PlainListStyle())
                    .padding(.horizontal, 20)
                }
                .position(x: geometry.size.width/2, y: geometry.size.height - 150)
            
            }
        }
    }
}

struct ScoreboardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreboardView()
    }
}
