import Foundation
import SwiftUI

class InsertPokemon {
    
    var pokemonType: String
    var pokemonData: PokemonData
    var pokemonAtacks:[PokemonAtacks]
    var img:UIImage
    
    public func checkifnull() -> String{
        var msg = ""
        print("coco",pokemonType)
        if(pokemonData.PokeName.isEmpty){
            msg = "Defina um nome do pokemon"
        }
        else if(pokemonType == "Selecionar"){
            msg = "Defina um Tipo de pokemon"
        }
        else if(img == UIImage(named: "noimg")){
            msg = "Defina uma Imagem para o pokemon"
        }
        else{
            var i = 1
            for atack in pokemonAtacks{
                if(atack.Ataque.isEmpty){
                    msg = "Defina o Ataque \(i)"
                    break
                }else if(atack.Dano.isEmpty){
                    msg = "Defina o Dano \(i)"
                    break
                }else if(!atack.Dano.isNumber){
                    msg = "Dano não pode conter letras"
                    break
                }else if(Int(atack.Dano)! > 50){
                    msg = "O dano tem que ser menor ou igual a 50"
                    break
                }
                i = i + 1
            }
        }
        return msg
    }
    
    func Insert () {
        do{
            var base64:String = ""
            let pngData = img.pngData()
            base64 = pngData!.base64EncodedString()
        
            let pr:UpdateParams = UpdateParams(pokemonData: pokemonData, pokemonAtacks: pokemonAtacks, pokemonType: pokemonType, pokemonImage: base64);
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(pr)
            
            var request = URLRequest(url: URL(string: "https://poke.thetroia.com/InsertPokemon")!)
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
    
    init(pokemontype:String,pokemondata:PokemonData,pokemonatacks:[PokemonAtacks],imgr:UIImage){
        pokemonType = pokemontype
        pokemonData = pokemondata
        pokemonAtacks = pokemonatacks
        img = imgr
    }
}
