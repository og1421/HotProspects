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
    var isContacted = false
}
