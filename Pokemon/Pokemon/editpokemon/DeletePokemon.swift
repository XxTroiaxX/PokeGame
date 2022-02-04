//
//  DeletePokemon.swift
//  Pokemon
//
//  Created by Pedro Magalhães Troia on 13/01/2022.
//

import Foundation

class DeletePokemon : ObservableObject{
    func Delete (id:Int) {
        let params = ["id":String(id)] as Dictionary<String, String>
        var request = URLRequest(url: URL(string: "https://poke.thetroia.com/DeletePokemon")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        let key:String = ProcessInfo.processInfo.environment["ACCESS_TOKEN"]!
        request.setValue(key, forHTTPHeaderField:"Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request).resume()
    }
}

