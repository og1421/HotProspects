//
//  ContentView.swift
//  HotProspects
//
//  Created by Orlando Moraes Martins on 07/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack {
            Text("Hello World")
                .padding()
                .background(backgroundColor)
            
            Text("Change color")
                .padding()
                .contextMenu{
                    Button(role: .destructive) {
                        backgroundColor = .red
                    } label: {
                        Label("Red" , systemImage: "checkmark.circle.fill")
                    }
                    
                    Button("Green") {
                        backgroundColor = .green
                    }
                    
                    Button("Blue") {
                        backgroundColor = .blue
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
