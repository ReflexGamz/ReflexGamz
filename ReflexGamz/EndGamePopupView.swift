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
        GeometryReader{ geometry in
            ZStack {

                VStack(spacing: 20) {
                    Image(systemName: "trophy.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.yellow)
                        .padding(.top, 40)
                    
                    Text("Congratulations!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("You've finished the game!")
                        .font(.title2)
                        .foregroundColor(.white)
                    
                        Button(action: {
                            // Play again action
                        }) {
                            HStack {
                                Image(systemName: "arrow.clockwise.circle.fill")
                                    .font(.headline)
                                Text("Play Again")
                                    .font(.headline)
                                    .fontWeight(.bold)
                            }
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                        }
                        
                        Button(action: {
                            // Go back to main menu action
                            isPresented = false
                        }) {
                            HStack {
                                Image(systemName: "house.fill")
                                    .font(.headline)
                                Text("Go Back to Main Menu")
                                    .font(.headline)
                                    .fontWeight(.bold)
                            }
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)

                    }
                    
                }
                .padding()
                .background(Color.black.opacity(0.8))
                .cornerRadius(20)
                .shadow(radius: 20)
                .padding()
        
            }
            .position(x: geometry.size.width/2, y: geometry.size.height/2)
        }
        
    }
}

struct EndGamePopupView_Previews: PreviewProvider {
    static var previews: some View {
        EndGamePopupView(isPresented: .constant(true))
    }
}
