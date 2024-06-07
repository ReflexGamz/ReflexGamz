//
//  MainView.swift
//  ReflexGamz
//
//  Created by Andreas Jacob on 5/26/24.
//

import SwiftUI

struct MainView: View {
    @State private var location = CGPoint(x: 0, y: -140)
    @State private var showDifficulty = false
    @State private var showTheme = false
    var body: some View {
        
        ZStack{
                
                //Background Color
                Color("BGColor")
                    .ignoresSafeArea()
                
                VStack{
                    
                    //Logo
                    Image("LogoGame")
                        .resizable()
                        .frame(width: 225, height: 150)
                        .offset(x: 50, y: -20)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    HStack{
                        
                        //Theme, Scoreboard, and Difficulty Buttons
                        ZStack{
                            
                            //Difficulty
                            ZStack{
                                RoundedRectangle(cornerRadius: 12, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                    .fill(Color("GradientGray"))
                                    .frame(width: 200,height: 200)
                                
                                VStack {
                                    Image("DifficultyIcon")
                                        .resizable()
                                    .frame(width: 75, height: 75)
                                    
                                    Text("Difficulty")
                                        .font(.system(size: 20, weight: .bold, design: .rounded))
                                        .foregroundColor(.white)
                                }
                                .offset(CGSize(width: 25, height: 20))

                            }
                            .offset(CGSize(width: -30, height: 150))
                            .rotationEffect(.degrees(20))
                            .onTapGesture {
                                print("Tapped on Difficulty")
                                showDifficulty = true
                            }
                            
                            //Theme
                            ZStack{
                                RoundedRectangle(cornerRadius: 12, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                    .fill(Color("GradientGray"))
                                    .frame(width: 200,height: 200)
                                
                                VStack {
                                    Text("Theme")
                                        .font(.system(size: 20, weight: .bold, design: .rounded))
                                        .foregroundColor(.white)
                                    
                                    Image("ThemeIcon")
                                        .resizable()
                                    .frame(width: 75, height: 75)
                                
                                }
                                .offset(CGSize(width: 25, height: -20))
                            }
                            .offset(CGSize(width: -30, height: -150))
                            .rotationEffect(.degrees(-20))
                            .onTapGesture {
                                print("Tapped on Theme")
                                showTheme = true
                                //ThemeView()
                            }
                            
                            //Scoreboard
                            ZStack{
                                RoundedRectangle(cornerRadius: 12, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                    .fill(Color("GradientGray"))
                                    .frame(width: 225,height: 200)
                                
                                VStack {
                                    Image("ScoreBoardIcon")
                                        .resizable()
                                    .frame(width: 75, height: 75)
                                    
                                    Text("Scoreboard")
                                        .font(.system(size: 20, weight: .bold, design: .rounded))
                                        .foregroundColor(.white)
                                }
                            }
                            .offset(CGSize(width: -50, height: 0))
                            .shadow(radius: 20)
                            .onTapGesture {
                                print("Tapped on Scoreboard")
                                //LeaderboardView()
                            }

                        }
                        .frame(height: 500)
                        
                        Spacer()
                            .frame(width: 10)
                            
                        //Play Button & Text
                        HStack {
                           
                            //Drag Sequence
                            ZStack{
                                
                                VStack {
                                    Image("DownArrow")
                                        .resizable()
                                    .frame(width: 40, height: 225)
                                }
                                
                                Image("HandIcon")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .offset(x: location.x , y: location.y)
                                    .gesture(DragGesture(minimumDistance: 10)
                                        .onEnded { value in
                                            withAnimation(.easeInOut(duration: 0.5)) {
                                                location.y = 140
                                            }
                                            // gameview()
                                            print("Transferred to the gameview()")
                                            
                                        }
                                    )
                            }
                            
                            //Text for Drag Sequence
                            Text("Swipe down to play")
                                .font(.system(size: 60, weight: .bold, design: .rounded))
                                .foregroundStyle(Color.white)
                                .lineLimit(1)
                                .fixedSize(horizontal: true, vertical: true)
                                .rotationEffect(Angle(degrees: 90))
                                .frame(width: 50, height: 500)
                                //.offset(x: 40)
                                .blur(radius: 1.5)
                                .overlay(
                                    Text("Swipe down to play")
                                        .font(.system(size: 60, weight: .bold, design: .rounded))
                                        .foregroundStyle(Color("BGColor"))
                                        .lineLimit(1)
                                        .fixedSize(horizontal: true, vertical: true)
                                        .rotationEffect(Angle(degrees: 90))
                                        .frame(width: 50, height: 500)
                                        //.offset(x: 40)
                                )
                                
                        }
                        .frame(height: 500)

                    }
                    .padding(.vertical)
                    
                }
                
            }
            
            .onAppear {
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                AppDelegate.orientationLock = .portrait
            }
            .onDisappear {
                AppDelegate.orientationLock = .all
            }
            .sheet(isPresented: $showDifficulty) {
                DifficultySlider()
            }
            .sheet(isPresented: $showTheme) {
                ThemeSlider()
            }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


