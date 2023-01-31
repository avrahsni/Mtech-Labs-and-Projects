//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Snir Avrahami on 1/13/23.
//

import SwiftUI

struct ContentView: View {
    @State private var endGame = false
    @State private var endPrompt = "Game Over"
    @State private var questionNum = 0
    @State private var score = 0
    
    @State private var options = ["Rock", "Paper", "Scissors"]
    @State private var correctAnswer = {
//        switch appChoice {
//        case 0:
//            return 1
//        case 1:
//            return 2
//        case 2:
//            return 0
//        }
        return 0
    }
    @State private var appChoice = Int.random(in: 0...2)
    let conditions = ["Win", "Lose"]
    
    @State private var condition = Int.random(in: 0...1)
    
    var body: some View {
        VStack {
            Spacer()
            Text("Score: \(score)")
                .font(.title)
            Spacer()
            Text("The App Chose \(options[appChoice])")
            Text("What do you need to chose in order to \(conditions[condition])?")
            Spacer()
            HStack {
                ForEach(0..<3) { number in
                    Button {
                        optionTapped(number)
                    } label: {
                        Image(options[number])
                            .resizable()
                            .background(.white)
                            .frame(maxWidth: 300)
                            .frame(maxHeight: 90)
                    }
                    
                }
            }
            Spacer()
            Spacer()
        }
        .padding()
        .alert(endPrompt, isPresented: $endGame) {
            Button("Restart", action: restartGame)
        } message: {
            Text("You got \(score)/10 points")
        }
    }
    
//    func loadTurn() {
//        appChoose()
//        conditionChoose()
//    }
    
    func restartGame() {
        questionNum = 0
        score = 0
        askQuestion()
    }
    
    func askQuestion() {
        appChoice = Int.random(in: 0...2)
        condition = Int.random(in: 0...1)
    }
    
    
    func optionTapped(_ number: Int) {
//        scoreTitle = number == correctAnswer ? "Correct" : "Incorrect"
        if conditions[condition] == "Win" {
            if appChoice != 2 {
                score += number == appChoice + 1 ? 1 : 0
            } else {
                score += number == 0 ? 1 : 0
            }
        } else {
            if appChoice != 0 {
                score += number == appChoice - 1 ? 1 : 0
            } else {
                score += number == 2 ? 1 : 0
            }
        }
        askQuestion()
        
//        chosenFlag = countries[number]
        questionNum += 1
        if questionNum >= 10 {
            endGame = true
        }
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
