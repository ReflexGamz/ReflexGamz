//
//  File.swift
//  ReflexGamz
//
//  Created by SEUNGBIN LEE on 6/9/24.
//

import SwiftUI

struct EndGamePopupView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                Text("Congratulations!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                
                Text("You've finished the game!")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                
                Button(action: {
                    // Play again action
                }) {
                    Text("Play Again")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                }
                .background(Color.black)
                .cornerRadius(10)
                .padding()
                
                Button(action: {
                    // Go back to main menu action
                    isPresented = false
                }) {
                    Text("Go Back to Main Menu")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                }
                .background(Color.red)
                .cornerRadius(10)
                .padding()
            }
            .background(Color.gray)
            .cornerRadius(20)
            .padding()
        }
    }
}

struct EndGamePopupView_Previews: PreviewProvider {
    static var previews: some View {
        EndGamePopupView(isPresented: .constant(true))
    }
}

