//
//  PokemonData.swift
//  Pokemon
//
//  Created by Pedro Magalhães Troia on 31/12/2021.
//

import Foundation


struct PokemonData: Hashable,Codable{
    var IDPokedex:Int
    var PokeName:String
    var PokeVida:String
    var VidaAtual:String
    var PokeFoto:String
    var TypePoke:String
    var Nivel:Int
    var NivelXP:Int
}
