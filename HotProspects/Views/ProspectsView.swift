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
    
    let filter: FilterType
    
    var body: some View {
        NavigationView{
            Text("Hello World!")
                .navigationTitle(title)
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
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
