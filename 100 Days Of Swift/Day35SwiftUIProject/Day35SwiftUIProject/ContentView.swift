//
//  ContentView.swift
//  Day35SwiftUIProject
//
//  Created by Snir Avrahami on 1/24/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var questionNum: Int = 1
    @State private var tableSize: Double = 2.0
    
    @State private var firstNum = Int.random(in: 2...2)
    @State private var secondNum = Int.random(in: 2...12)
    
    
    
    var body: some View {
        
        NavigationView {
            Form {
                Section("How many questions you want to answer?") {
                    //                    Stepper("\(questionNum, specifier: "%0.f") question(s)", value: $questionNum, in: 1...99, step: 1.0)
                    Picker(questionNum > 1 ? "\(questionNum) questions" : "1 question", selection: $questionNum, content: {
                        ForEach(1...99, id: \.self) { num in
                            Text("\(num)")
                        }
                    })
                }
                
                Section("What multiplication table do you want?") {
                    Stepper("Up to \(tableSize, specifier: "%0.f")s tables", value: $tableSize, in: 2...12, step: 1.0) { _ in
                        getNums(Int(tableSize))
                    }
                    
                }
                
                NavigationLink("Start Game") {
                    GameView(firstNum: $firstNum, secondNum: $secondNum, questionNum: $questionNum, tableSize: $tableSize)
                }
                .foregroundColor(.accentColor)
                
                
            }
            .navigationTitle(Text("Configuration"))
        }
        
    }
    
    func getNums(_ table: Int) {
        firstNum = Int.random(in: 2...table)
        secondNum = Int.random(in: 2...12)
    }
}



struct GameView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var firstNum: Int
    @Binding var secondNum: Int
    @State private var score = 0
    @State private var ans = ""
    
    @Binding var questionNum: Int
    @State private var questionIndex = 1
    @Binding var tableSize: Double
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var gameOverShowing = false
    @State private var showingScore = false
    @State private var endPrompt = "Game Over"
    

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HStack {
                    Text("\(firstNum)")
                        .font(.largeTitle)
                        .bold()
                    Text("X")
                        .font(.largeTitle)
                        .bold()
                        .padding(50)
                    Text("\(secondNum)")
                        .font(.largeTitle)
                        .bold()
                }
                VStack {
                    Spacer()
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                Form {
                    Section("What is your answer?") {
                        TextField("Type Your Answer Here", text: $ans)
                        Button("Submit") {
                            checkAns()
                            if questionIndex <= questionNum {
                                showingScore.toggle()
                            } else {
                                gameOverShowing = true
                            }
                        }
                        
                    }
                }
            }
        }
        .alert(alertTitle, isPresented: $showingScore) {
            Button("Continue") {
                getNums(Int(tableSize))
            }
        } message: {
            Text(alertMessage)
        }
        .alert(endPrompt, isPresented: $gameOverShowing) {
            Button("Restart", action: restartGame)
//            NavigationLink("Restart", destination: ContentView())
        } message: {
            Text("You got \(score)/\(questionNum) points")
        }
        .navigationTitle(Text("Question \(questionIndex)"))
    }
    
    func checkAns() {
        guard let answer = Int(ans) else {
            alertTitle = "Invalid Input"
            alertMessage = "Please enter a real number"
            return
        }
        ans = ""
        questionIndex += 1
        if answer == firstNum * secondNum {
            score += 1
            alertTitle = "Correct"
            alertMessage = "\(score)/\(questionNum)"
        } else {
            alertTitle = "Incorrect"
            alertMessage = "\(score)/\(questionNum)"
        }
    }
    
    func getNums(_ table: Int) {
        firstNum = Int.random(in: 2...table)
        secondNum = Int.random(in: 2...12)
        showingScore = false
    }
    
    func restartGame() {
        questionNum = 5
        score = 0
        gameOverShowing = false
        getNums(Int(tableSize))
        self.dismiss()
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
