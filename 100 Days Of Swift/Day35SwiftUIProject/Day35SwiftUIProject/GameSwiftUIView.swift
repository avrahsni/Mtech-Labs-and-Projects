//
//  GameSwiftUIView.swift
//  Day35SwiftUIProject
//
//  Created by Snir Avrahami on 1/24/23.
//

import SwiftUI

struct GameSwiftUIView: View {
    @State private var ans = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
//                Text("Solve The Equation:")
//                    .font(.largeTitle)
//                    .padding(50)
                HStack {
                    Text("7")
                        .font(.largeTitle)
                        .bold()
                    Text("X")
                        .font(.largeTitle)
                        .bold()
                        .padding(50)
                    Text("3")
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
                            checkAnswer()
                        }
                    }
                }
            }
            .navigationTitle(Text("Solve the Equation"))
        }
        
    }
    
    func checkAnswer() {
        
    }
}

struct GameSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GameSwiftUIView()
    }
}
