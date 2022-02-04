//
//  ResultType.swift
//  Pokemon
//
//  Created by Pedro Magalhães Troia on 16/01/2022.
//

import Foundation


struct ResultType: Hashable,Codable{
    var types:[Types]
}

struct Types: Hashable,Codable{
    var TypePoke:String
}

