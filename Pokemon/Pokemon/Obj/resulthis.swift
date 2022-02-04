//
//  resulthis.swift
//  Pokemon
//
//  Created by Pedro Magalhães Troia on 31/01/2022.
//

import Foundation

struct HistData: Hashable,Codable{
    var Estado:String
    var Amigo:PokeHistData
    var Inimigo:PokeHistData
}
