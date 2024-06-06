//
//  LaunchScreen.swift
//  ReflexGamz
//
//  Created by Ugur Randa on 6/5/24.
//

import SwiftUI

struct LaunchScreen: View {
    var body: some View {
    
        ZStack{
            Color("BGColor")
                .ignoresSafeArea()
            Image("LogoGame")
                .resizable()
                .frame(width: 250, height: 150)
        }
    
    }
    
}

#Preview {
    LaunchScreen()
}
