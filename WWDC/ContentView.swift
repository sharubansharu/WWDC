//
//  ContentView.swift
//  WWDC
//
//  Created by Sharuban Sharu on 4/22/25.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [.purple, .blue, .pink]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            // Animated WWDC Text
            Text("WWDC25")
                .font(.system(size: 64, weight: .bold))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.white, .yellow, .orange],
                        startPoint: animate ? .topLeading : .bottomTrailing,
                        endPoint: animate ? .bottomTrailing : .topLeading
                    )
                )
                .scaleEffect(animate ? 1.1 : 0.9)
                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true),value: animate)
                .onAppear{
                    animate = true
                }
        }
    }
}

#Preview {
    ContentView()
}
