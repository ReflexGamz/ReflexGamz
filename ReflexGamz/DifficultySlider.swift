//
//  DifficultySlider.swift
//  ReflexGamz
//
//  Created by Andreas Jacob on 6/5/24.
//

import SwiftUI

struct DifficultySlider: View {
    @State private var selectedOption = 0
    @State private var diffChoosen = "Easy"
    
    let options = ["Easy", "Medium", "Hard"]
    
    var body: some View {
        ZStack {
            Color("BGColor")
                .ignoresSafeArea()
            
            VStack {
                Text("Choose Difficulty")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .offset(y: 50)
                
                Picker("Select an option", selection: $selectedOption) {
                    ForEach(0..<options.count) { index in
                        Text(self.options[index]).tag(index)
                            .foregroundColor(.white)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .labelsHidden()
                .onChange(of: selectedOption) { newValue in
                    diffChoosen = options[newValue]
                }
            }
        }
    }
}

#Preview {
    DifficultySlider()
}

