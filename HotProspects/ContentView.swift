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
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button(role: .destructive) {
                        print("Delete")
                    } label: {
                        Label ("delete", systemImage: "minus.circle")
                    }
                }
                .swipeActions(edge: .leading){
                    Button{
                        print("Pinning")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
