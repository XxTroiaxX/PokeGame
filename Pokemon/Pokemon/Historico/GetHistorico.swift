import Foundation

class GetHistorico : ObservableObject{
    @Published var histpoke:[HistData] = [];
    func fetch () {
        var request = URLRequest(url: URL(string: "https://poke.thetroia.com/GetHistorico")!)
        request.httpMethod = "GET"
        let key:String = ProcessInfo.processInfo.environment["ACCESS_TOKEN"]!
        request.setValue(key, forHTTPHeaderField:"Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request, completionHandler: {[weak self]data, response, error in
                guard let data = data else { return }
                do {
                    let jsondeco = JSONDecoder()
                    let data = try jsondeco.decode([HistData].self, from: data)
                    print("data: ", data)
                    DispatchQueue.main.async{
                        self!.histpoke = data
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
