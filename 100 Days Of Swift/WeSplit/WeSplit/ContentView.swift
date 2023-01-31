//
//  ContentView.swift
//  WeSplit
//
//  Created by Snir Avrahami on 1/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkamount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 15
    @FocusState private var amountIsFocused: Bool
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let grandTotal = checkamount + ((checkamount / 100) * tipSelection)
        
        return grandTotal / peopleCount
    }
    
    var currency = Locale.current.currency?.identifier ?? "ILS"
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkamount, format: .currency(code: currency))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) { Text("\($0) people") }
                    }
                }
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<101) { Text($0, format: .percent) }
                    }.pickerStyle(.menu)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                Section {
                    Text(totalPerPerson * (Double(numberOfPeople) + 2), format: .currency(code: currency))
                        .foregroundColor(tipPercentage <= 0 ? .red : .black)
                } header: {
                    Text("Grand Total:")
                        
                }
                Section {
                    Text(totalPerPerson, format: .currency(code: currency))
                } header: {
                    Text("Amount per person:")
                }
            }.navigationTitle("WeSplit")
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
