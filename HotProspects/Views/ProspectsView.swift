//
//  Prospects.swift
//  HotProspects
//
//  Created by Orlando Moraes Martins on 10/01/23.
//

import SwiftUI

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    @EnvironmentObject var prospects: Prospects
    
    let filter: FilterType
    
    var body: some View {
        NavigationView {
            List (filteredProspecets) { prospect in
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    
                    Text(prospect.emailAdress)
                        .foregroundColor(.secondary)
                    
                    
                }
            }
            .navigationTitle(title)
            .toolbar {
                Button {
                    let prospect = Prospect()
                    prospect.name = "Paul Hudson"
                    prospect.emailAdress = "paul@hackingwithswift.com"
                    prospects.people.append(prospect)
                } label: {
                    Label("Scan", systemImage: "qrcode.viewfinder")
                }
            }
        }
    }
    
    var title: String {
        switch filter {
            case.none:
            return "Everyone"
            
        case .contacted:
            return "Contacted people"
            
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    
    var filteredProspecets: [Prospect] {
        switch filter {
            case.none:
            return prospects.people
            
        case .contacted:
            return prospects.people.filter { $0.isContacted }
            
        case .uncontacted:
            return prospects.people.filter { !$0.isContacted }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
            .environmentObject(Prospects())
    }
}
