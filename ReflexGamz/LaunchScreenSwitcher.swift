//
//  LaunchScreenSwitcher.swift
//  ReflexGamz
//
//  Created by Ugur Randa on 6/5/24.
//

import SwiftUI

struct LaunchScreenSwitcher: View {
    @State var switcher: Bool = false
    
    var body: some View {
        ZStack{
            Color("BGColor")
                .ignoresSafeArea()
            
            if switcher{
                MainView()
            }else{
                LaunchScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation(.easeInOut(duration: 1)){
                                self.switcher = true
                            }
                        }
                        
                    }
            }
            
        }
    }
    
}

#Preview {
    LaunchScreenSwitcher()
}
