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
        
        if switcher{
            MainView()
        }else{
            LaunchScreen()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.switcher = true
                        }
                    }
                    
                }
            
        }
    }
}

#Preview {
    LaunchScreenSwitcher()
}
