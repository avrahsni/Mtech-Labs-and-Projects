//
//  ContentView.swift
//  UnitConversions100Days
//
//  Created by Snir Avrahami on 1/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "celsius"
    @State private var outputUnit = "celsius"
    @State private var inputAmount = 0.0
    @FocusState private var amountIsFocused: Bool
    
    let unitOptions = ["celsius", "fahrenheit", "kelvin"]
    
    var output: Double {
        let input = inputAmount
        
        switch inputUnit {
        case "celsius":
            switch outputUnit {
            case "celsius":
                return input
            case "fahrenheit":
                return (input * (9 / 5)) + 32
            case "kelvin":
                return input + 273.15
            default:
                return 0
            }
        case "kelvin":
            switch outputUnit {
            case "celsius":
                return input - 273.15
            case "fahrenheit":
                return ((input - 273.15) * (9 / 5)) + 32
            case "kelvin":
                return input
            default:
                return 0
            }
        case "fahrenheit":
            switch outputUnit {
            case "celsius":
                return (input - 32) * (5 / 9)
            case "fahrenheit":
                return input
            case "kelvin":
                return ((input - 32) * (5 / 9)) + 273.15
            default:
                return 0
            }
        default:
            return 0
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(unitOptions, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Choose input unit")
                }
                Section {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(unitOptions, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Choose output unit")
                }
                Section {
                    TextField("Input", value: $inputAmount, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                } header: {
                    Text("Enter Input Amount:")
                }
                Section {
                    Text(output, format: .number)
                } header: {
                    Text("Output:")
                }
            }.navigationTitle("Temp.  Converter")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
