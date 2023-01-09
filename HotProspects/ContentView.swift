//
//  ContentView.swift
//  HotProspects
//
//  Created by Orlando Moraes Martins on 07/01/23.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack{
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound] ){
                    success, error in
                    
                    if success {
                        print("All set")
                    } else if let  error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule notification") {
                let content = UNMutableNotificationContent()
                content.title = "Feed the dogs"
                content.subtitle = "They look hungry"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
