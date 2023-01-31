//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Snir Avrahami on 1/13/23.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            .padding()
            .bold()
    }
}

extension View {
    func blueTitle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    @State private var useRedText = false
    
    
    
    var body: some View {
        
        Text("Hello, world!")
            .blueTitle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
