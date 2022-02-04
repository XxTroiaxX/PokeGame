import Foundation
import SwiftUI

class GetPokedex : ObservableObject{
    @Published var pokedexcol:[pokedex] = [];
    func fetch () {
        var request = URLRequest(url: URL(string: "https://poke.thetroia.com/Pokedex")!)
        request.httpMethod = "GET"
        let key:String = ProcessInfo.processInfo.environment["ACCESS_TOKEN"]!
        request.setValue(key, forHTTPHeaderField:"Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request, completionHandler: {[weak self]data, response, error in
                guard let data = data else { return }
                do {
                    let jsondeco = JSONDecoder()
                    let data = try jsondeco.decode([pokedex].self, from: data)
                    print("data: ", data)
                    DispatchQueue.main.async{
                        self!.pokedexcol = data
                    }
                  
                } catch let parseErr {
                  print("JSON Parsing Error", parseErr)
                }
          })
          
          task.resume()
    }
    
    init(){
        fetch()
    }
}
