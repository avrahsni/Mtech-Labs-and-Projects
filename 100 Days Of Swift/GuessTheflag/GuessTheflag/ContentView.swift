//
//  ContentView.swift
//  GuessTheflag
//
//  Created by Snir Avrahami on 1/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var endGame = false
    @State private var scoreTitle = ""
    @State private var endPrompt = "Game Over"
    @State private var score = 0
    @State private var questionNum = 0
    @State private var chosenFlag = ""
    @State private var tapped = false
    @State private var timeRemaining = 0.3
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    func flagImage(_ number: Int) -> some View {
        Image(countries[number])
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.05), location: 0.3)], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                
                Spacer()
                
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                
                VStack(spacing: 20) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            self.tapped.toggle()
                            flagTapped(number)
                        } label: {
                            flagImage(number)
                        }
                        .rotation3DEffect(Angle(degrees: tapped && number == correctAnswer ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        .opacity(tapped && number != correctAnswer ? 0.25 : 1)
                        .scaleEffect(tapped && number != correctAnswer ? 0.75 : 1)
                        .animation(.easeInOut, value: tapped)
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .font(.title.bold())
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(calcMessage())
            //"Your Score is \(score)"
        }
        .alert(endPrompt, isPresented: $endGame) {
            Button("Restart", action: restartGame)
        } message: {
            Text("You got \(score)/8 points")
        }
    }
    
    func flagTapped(_ number: Int) {
        scoreTitle = number == correctAnswer ? "Correct" : "Incorrect"
        score += number == correctAnswer ? 1 : 0
        chosenFlag = countries[number]
        questionNum += 1
        let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
//        while timeRemaining > 0 {
//            onReceive(timer) { _ in
//                timeRemaining -= 0.1
//                print(timeRemaining)
//            }
//        }
        if questionNum >= 8 {
            endGame = true
        } else {
            showingScore = true
        }
        
    }
    
    func restartGame() {
        questionNum = 0
        score = 0
        askQuestion()
    }
    
    func calcMessage() -> String {
        if chosenFlag == countries[correctAnswer] {
            return "Your score is \(score)"
        } else {
            return "That's the flag of \(chosenFlag)"
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        tapped.toggle()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
