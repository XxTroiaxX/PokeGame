//
//  UpdateParams.swift
//  Pokemon
//
//  Created by Pedro Magalhães Troia on 13/01/2022.
//

import Foundation

struct UpdateParams: Codable{
    var pokemonData:PokemonData
    var pokemonAtacks:[PokemonAtacks]
    var pokemonType:String
    var pokemonImage:String
}
