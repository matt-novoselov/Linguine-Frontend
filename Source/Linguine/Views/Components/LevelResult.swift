//
//  levelResult.swift
//  Linguine (iOS)
//
//  Created by Matt Novoselov on 25/04/24.
//

import SwiftUI

struct LevelResult: View {

    // Load motivational messages from the View Model
    var levelResultModel: LevelResultModel = LevelResultModel()

    // Correct answer to the level
    var correctAnswer: String

    // Variable to dismiss current sheet
    @Environment(\.dismiss) var dismiss
    
    // Random motivational messages
    @State private var completionMessage: String = ""
    @State private var incorrectMessage: String = ""
    
    // Action that will be performed after pressing "Continue" button
    var action: () -> Void
    
    // Bool that determines if the answer given by user was correct
    var isCorrect: Bool

    var body: some View {
        
        VStack(alignment: .leading ,spacing: 20){
            
            // Present result View based on user answer
            if isCorrect{
                CorrectResult(completionMessage: $completionMessage)
            } else{
                IncorrectResult(correctAnswer: correctAnswer, incorrectMessage: $incorrectMessage)
            }
            
            DropButton(title: isCorrect ? "continue" : "got it", action: {self.dismiss(); action()}, style: isCorrect ? .correct : .mistake)
        }
        .padding(.horizontal)
        .padding(.top)
        
        // Get random motivational message
        .onAppear(){
            completionMessage=levelResultModel.completionMessages.randomElement()!
            incorrectMessage=levelResultModel.incorrectMessages.randomElement()!
        }
        
    }
}

struct CorrectResult: View {
    
    // Random motivational messages
    @Binding var completionMessage: String
    
    var body: some View {
        
        Group{
            HStack{
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 24))
                    .accessibilityHidden(true)
                
                Text(completionMessage)
                    .font(Font.custom("DINNextRoundedLTPro-Bold", size: 24))
            }
        }
        .foregroundColor(.lgGreenButton)
        
        // Perform heavy haptic feedback
        .onAppear(){
            heavy()
        }
        
    }
}

struct IncorrectResult: View {
    
    // Correct answer to the level
    var correctAnswer: String
    
    // Random motivational messages
    @Binding var incorrectMessage: String

    var body: some View {
        
        Group{
            HStack{
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 24))
                    .accessibilityHidden(true)
                
                Text(incorrectMessage)
                    .font(Font.custom("DINNextRoundedLTPro-Bold", size: 24))
            }
            
            HStack(spacing:0){
                Text("Correct Answer: ")
                    .font(Font.custom("DINNextRoundedLTPro-Bold", size: 20))
                
                Text(correctAnswer)
                    .font(Font.custom("DINNextRoundedLTPro-Regular", size: 20))
            }
        }
        .foregroundColor(.lgRedButton)
        
    }
}
