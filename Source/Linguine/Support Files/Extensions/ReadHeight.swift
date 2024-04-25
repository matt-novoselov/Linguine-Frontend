//
//  readHeight.swift
//  Linguine (iOS)
//
//  Created by Matt Novoselov on 25/04/24.
//

import SwiftUI

// This extension is used to get the height of a particular View
// The extension is used to present sheet of the correct size
extension View {
    func readHeight() -> some View {
        self
            .modifier(ReadHeightModifier())
    }
}

// Define a custom ViewModifier to read the height of the modified view.
private struct ReadHeightModifier: ViewModifier {
    // Define a private computed property that returns a view with GeometryReader
    // to read the height of the modified view and set it as a preference value.
    private var sizeView: some View {
        GeometryReader { geometry in
            // Use a transparent Color to measure the height of the view and set it as a preference value.
            Color.clear.preference(key: HeightPreferenceKey.self, value: geometry.size.height)
        }
    }
    
    // Implement the body method required by ViewModifier.
    // This method adds the sizeView as a background to the content view.
    func body(content: Content) -> some View {
        content.background(sizeView)
    }
}

// Define a custom PreferenceKey to store the height preference value.
struct HeightPreferenceKey: PreferenceKey {
    // Define the default value of the preference key.
    static var defaultValue: CGFloat?
    
    // Implement the reduce function to accumulate the height values.
    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        // If nextValue is not nil, update the value with the new height value.
        guard let nextValue = nextValue() else { return }
        value = nextValue
    }
}

