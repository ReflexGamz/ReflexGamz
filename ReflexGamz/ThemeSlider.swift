//
//  ThemeSlider.swift
//  ReflexGamz
//
//  Created by Andreas Jacob on 6/6/24.
//

import SwiftUI

struct ThemeSlider: View {
    var body: some View {
        
        ZStack{
            
            Color("BGColor")
                .ignoresSafeArea()
            
            VStack{
                
                Text("Choose Theme")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                
                Spacer()
                    .frame(height: 50)
                
                ZStack{//EmojiTheme
                    
                    RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .fill(Color.white.opacity(0.2))
                        .opacity(0.2)
                        .frame(width: 250, height: 100)
                        
                    HStack {
                        
                        Text("Emojis")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                        
                        Spacer()
                            .frame(width: 20)
                        
                        Image("Emoji3D")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .offset(x: 10, y: -30)
                    }
    
                }
                .onTapGesture {
                    print("Tapped on Emoji Theme")
                    //ThemeSelection()
                }
                
                Spacer()
                    .frame(height: 30)
                
                ZStack{//CarTheme
                    
                    RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .fill(Color.white.opacity(0.2))
                        .opacity(0.2)
                        .frame(width: 250, height: 100)
                        
                    HStack {
                        
                        Image("Car3D")
                            .resizable()
                            .frame(width: 140, height: 140)
                            .offset(x: -10, y: -30)
                        
                        Spacer()
                            .frame(width: 20)
                        
                        Text("Cars")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .offset(x: -10)
                    }
            
                }
                .onTapGesture {
                    print("Tapped on Car Theme")
                    //ThemeSelection()
                }
                
                Spacer()
                    .frame(height: 10)
                
                ZStack{//FoodTheme
                    
                    RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .fill(Color.white.opacity(0.2))
                        .opacity(0.2)
                        .frame(width: 250, height: 100)
                        
                    HStack {
                        
                        Text("Food")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .offset(x: 20)
                        
                        Spacer()
                            .frame(width: 20)
                        
                        Image("Food3D")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .offset(x: 10, y: -30)
                    }
            
                }
                .onTapGesture {
                    print("Tapped on Food Theme")
                    //ThemeSelection()
                }
                
            }
        }
    }
}

#Preview {
    ThemeSlider()
}
