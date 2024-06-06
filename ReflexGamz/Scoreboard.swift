//
//  Scoreboard.swift
//  ReflexGamz
//
//  Created by SEUNGBIN LEE on 6/3/24.
//

import SwiftUI

// Leaderboard entry model
struct LeaderboardEntry {
    let playerName: String
    let score: Int
}

// Leaderboard data management
class LeaderboardManager: ObservableObject {
    @Published var leaderboardData: [LeaderboardEntry] = []

    // Function to update leaderboard data
    func updateLeaderboard(with entries: [LeaderboardEntry]) {
        // Assuming entries are sorted by score in descending order
        leaderboardData = Array(entries.prefix(10)) // Limit to top 10 entries
    }
}

// Leaderboard view
struct LeaderboardView: View {
    @ObservedObject var leaderboardManager: LeaderboardManager

    var body: some View {
        NavigationView {
            List {
                ForEach(leaderboardManager.leaderboardData, id: \.playerName) { entry in
                    Text("\(entry.playerName): \(entry.score)")
                }
            }
            .navigationTitle("Leaderboard")
        }
    }
}

// Leaderboard view preview
struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        let leaderboardManager = LeaderboardManager()
        leaderboardManager.updateLeaderboard(with: [
            LeaderboardEntry(playerName: "Player1", score: 100),
            LeaderboardEntry(playerName: "Player2", score: 90),
            LeaderboardEntry(playerName: "Player3", score: 80),
            LeaderboardEntry(playerName: "Player4", score: 70),
            LeaderboardEntry(playerName: "Player5", score: 60),
            LeaderboardEntry(playerName: "Player6", score: 50),
            LeaderboardEntry(playerName: "Player7", score: 40),
            LeaderboardEntry(playerName: "Player8", score: 30),
            LeaderboardEntry(playerName: "Player9", score: 20),
            LeaderboardEntry(playerName: "Player10", score: 10)
        ])
        return LeaderboardView(leaderboardManager: leaderboardManager)
    }
}
