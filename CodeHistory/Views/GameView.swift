//
//  ContentView.swift
//  CodeHistory
//
//  Created by cecily li on 9/19/22.
//

import SwiftUI

struct GameView: View {
    let question = Question(
            questionText: "What was the first computer bug?",
            possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"],
            correctAnswerIndex: 2)
    
    @StateObject var viewModel = GameViewModel()
   
    var body: some View {
        ZStack {
            GameColor.main.ignoresSafeArea()
                VStack  {Text(viewModel.questionProgressText)
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .padding()
                    QuestionView(question: viewModel.currentQuestion)
            }
        }
        .background(
            NavigationLink(destination: ScoreView(viewModel: ScoreViewModel(correctGuesses: viewModel.correctGuesses, incorrectGuesses:viewModel.incorrectGuesses)),
                           isActive:
                    .constant(viewModel.gameIsOver),
                label: { EmptyView() })
                )
        .foregroundColor(.white)
        .navigationBarHidden(true)
        //any subviews will have access to the view model
        .environmentObject(viewModel)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
