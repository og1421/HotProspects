//
//  Prospect.swift
//  HotProspects
//
//  Created by Orlando Moraes Martins on 10/01/23.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAdress = ""
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    let saveKey = "SavedData"

    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data){
                people = decoded
                
                return
            }
        }
        
        //no saved data
        people = []
    }
    
    private func save() {
        if let encode = try? JSONEncoder().encode(people){
            UserDefaults.standard.set(encode, forKey: saveKey)
        }
    }
    
    func add( _ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
}
