//
//  Prospects.swift
//  HotProspects
//
//  Created by Orlando Moraes Martins on 10/01/23.
//

import CodeScanner
import SwiftUI

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    @EnvironmentObject var prospects: Prospects
    @State private var isShowingScaner = false
    
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
                .swipeActions{
                    if prospect.isContacted {
                        Button {
                            prospects.toggle(prospect)
                        } label: {
                            Label("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark")
                        }
                        .tint(.blue)
                    } else {
                        Button {
                            prospects.toggle(prospect)
                        } label: {
                            Label("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark")
                        }
                        .tint(.green)
                    }
                }
            }
            .navigationTitle(title)
            .toolbar {
                Button {
                    isShowingScaner = true
                } label: {
                    Label("Scan", systemImage: "qrcode.viewfinder")
                }
            }
            .sheet(isPresented: $isShowingScaner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: handleScan)
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
    
    func handleScan (result: Result<ScanResult, ScanError>) {
        isShowingScaner = false
        
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            
            let person = Prospect()
            person.name = details[0]
            person.emailAdress = details[1]
            
            prospects.people.append(person)
            
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
            .environmentObject(Prospects())
    }
}
