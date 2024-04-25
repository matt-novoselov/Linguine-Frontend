//
//  LevelprogressBar.swift
//  Linguine (iOS)
//
//  Created by Matt Novoselov on 25/04/24.
//

import SwiftUI

// Level progress bar is visible on the top of the level view and determines current progress of the user
struct LevelProgressBar: View {
    
    // Store the size of the view
    @State private var size: CGSize = .zero
    
    // Progress is the value from 0 to 1
    @State var progress: Double
    
    var body: some View {
        
        ZStack (alignment: .leading){
            // Underlying gray line
            RoundedRectangle(cornerRadius: 90)
                .frame(height: 20)
                .foregroundColor(.lgDisabledButton)
            
            // Main progress indicator
            ZStack{
                // Main green line
                RoundedRectangle(cornerRadius: 90)
                    .frame(height: 20)
                    .foregroundColor(.lgGreenButton)
                
                // White top up
                RoundedRectangle(cornerRadius: 90)
                    .frame(height: 5)
                    .foregroundColor(.white)
                    .opacity(0.2)
                    .padding(.horizontal)
                    .padding(.bottom, 6)
            }
            .frame(width: CGFloat(size.width) * CGFloat(progress==0 ? 0.1 : progress))
        }
        
        // Determine frame size using GeometryReader
        .background{
            GeometryReader { proxy in
                Color.clear
                    .onAppear {
                        size = proxy.size
                    }
            }
        }
        
    }
}
