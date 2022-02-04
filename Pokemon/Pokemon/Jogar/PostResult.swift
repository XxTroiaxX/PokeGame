//
//  PostResult.swift
//  Pokemon
//
//  Created by Pedro Magalhães Troia on 29/01/2022.
//

import Foundation


class PostResult{
    func InsertHist (Amigo:Int,Inimigo:Int,Estado:String,Nivel:Int,NivelXP:Int,Vida:String) {
        do{
            var nivel:Int = Nivel
            var xp:Int = NivelXP
            var vida:String = Vida
            
            xp += 10
            if(xp >= 100){
                nivel = nivel + 1
                xp = 0
                vida = String(Int(vida)! + 20)
            }
            
            let insert:InsertHistorico = InsertHistorico(IDPokemonAmigo: Amigo, IDPokemonInimigo: Inimigo, Estado: Estado, Nivel: nivel, NivelXP: xp,Vida: vida)
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(insert)
            
            var request = URLRequest(url: URL(string: "https://poke.thetroia.com/InsertHistorico")!)
            request.httpMethod = "POST"
            request.httpBody = data//try? JSONSerialization.data(withJSONObject: data, options: [])
            let key:String = ProcessInfo.processInfo.environment["ACCESS_TOKEN"]!
            request.setValue(key, forHTTPHeaderField:"Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            URLSession.shared.dataTask(with: request).resume()
        }catch let parseErr {
            print("JSON Parsing Error", parseErr)
        }
    }
}


