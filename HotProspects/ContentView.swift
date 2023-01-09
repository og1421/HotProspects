//
//  ContentView.swift
//  HotProspects
//
//  Created by Orlando Moraes Martins on 07/01/23.
//

import SwiftUI
import SamplePackage

struct ContentView: View {
    let possibleNumbers = Array(1...60)
    
    var body: some View {
       Text(results)
            .padding()
    }
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        
        return strings.joined(separator: ", ")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
