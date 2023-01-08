//
//  ContentView.swift
//  HotProspects
//
//  Created by Orlando Moraes Martins on 07/01/23.
//

import SwiftUI

@MainActor class DelayedUpdater: ObservableObject {
    var value = 0 {
        willSet{
            objectWillChange.send()
        }
    }
    
    init(){
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)){
                self.value += 1
            }
        }
    }
}

struct ContentView: View {
    @StateObject private var updater = DelayedUpdater()
    
    var body: some View {
        Text("value is \(updater.value)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
