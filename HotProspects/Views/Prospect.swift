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
    let saveKey = "data.json"

    init() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let url = documentsDirectory.appendingPathComponent(saveKey)
        
        guard let data = try? Data(contentsOf: url)  else {
            self.people = []
            return
        }
        
        do {
            people = try JSONDecoder().decode([Prospect].self, from: data)
        } catch {
            print("Error decoding the file \(error.localizedDescription)")
            self.people = []
        }
        
//        if let data = UserDefaults.standard.data(forKey: saveKey) {
//            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data){
//                people = decoded
//
//                return
//            }
//        }
//
//        //no saved data
//        people = []
    }
    
    private func save() {
        guard let jsonFile = try? JSONEncoder().encode(people) else {
            return
        }
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let fileURL = documentsDirectory.appendingPathComponent(saveKey)
        
        do {
            try jsonFile.write(to: fileURL)
        } catch {
            print("Can't save in directory \(error.localizedDescription)")
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
