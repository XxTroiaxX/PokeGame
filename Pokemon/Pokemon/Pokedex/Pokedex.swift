import SwiftUI
import Kingfisher

struct Pokedex: View {
    
    @Binding var backtoroot:Bool
    @StateObject var poke = GetPokedex()
    @StateObject var AllTypes = GetTypePokes()

    @Environment (\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView{
            ZStack{
                Image("background").resizable().edgesIgnoringSafeArea(.all)
                VStack{
                    List {
                        ForEach(poke.pokedexcol, id: \.self){ poketype in
                            Section{
                                ForEach(poketype.Pokemons, id: \.self){ pokemons in
                                    ForEach(pokemons.PokemonData, id: \.self){ poke in
                                        NavigationLink( destination: NavigationLazyView(editpokemon(type: poketype.PokeType, data: poke, atacks: pokemons.Atacks,types: AllTypes.typepokes,teste: $backtoroot))){
                                            ListView(poke: poke)
                                        }.listRowSeparator(.hidden)
                                    }
                                }
                            }header: {
                                KFImage(URL(string: poketype.TypeFoto)!).resizable().frame(width: 70,height:20)
                            }
                        }
                    }
                }
            }.navigationBarItems(
                leading: Button(action:{presentationMode.wrappedValue.dismiss()}){Image(systemName: "arrow.left").foregroundColor(.black)},
                trailing:
                    NavigationLink( destination: NavigationLazyView(addpokemon(teste: $backtoroot,types: AllTypes.typepokes))){
                        Image(systemName: "plus").foregroundColor(.black)
                    }
            ).navigationBarTitleDisplayMode(.inline).navigationTitle("Pokedex")
        }.navigationBarHidden(true).navigationViewStyle(StackNavigationViewStyle())
    }
     
    
    init(backtoroot: Binding<Bool>) {
        UITableView.appearance().backgroundColor = .clear // For tableView
        UITableViewCell.appearance().backgroundColor = .clear // For tableViewCell
        
        _backtoroot = backtoroot
    }
}



/*struct Pokedex_Previews: PreviewProvider {
    static var previews: some View {
        Pokedex()
    }
}*/
