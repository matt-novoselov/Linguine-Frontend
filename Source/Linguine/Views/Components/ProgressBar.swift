//
//  ProgressBar.swift
//  Linguine (iOS)
//
//  Created by Matt Novoselov on 25/04/24.
//

import SwiftUI

// Progress bar to indicate the completion of the level
struct ProgressBar: View {
    var body: some View {
        ZStack {
            Ellipse()
                .stroke(lineWidth: 7.0)
                .foregroundColor(.lgDisabledButton)
            
            Ellipse()
                .trim(from: 0.75, to: 1.0)
                .stroke(style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.lgBackground)
            
            Ellipse()
                .trim(from: 0.75, to: 1.0)
                .stroke(style: StrokeStyle(lineWidth: 7.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.lgPinkButton)
        }
        .frame(width: 90, height: 85)
        .padding(.bottom, 8)
    }
}

#Preview {
    ProgressBar()
}
