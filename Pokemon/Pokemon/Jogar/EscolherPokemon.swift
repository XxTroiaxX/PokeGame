//
//  EscolherPokemon.swift
//  Pokemon
//
//  Created by Pedro Magalhães Troia on 24/01/2022.
//

import SwiftUI
import Kingfisher

struct EscolherPokemon: View {
    
    @StateObject var poke = GetPokedex()
    @Binding var back:Bool


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
                                    ForEach(pokemons.PokemonData, id: \.self){ poke2 in
                                        NavigationLink( destination: NavigationLazyView(Jogar(dataamigo: poke2, ataquesamigo: pokemons.Atacks,dados:poke.pokedexcol, back: $back))){
                                            ListView(poke: poke2)
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
                leading: Button(action:{presentationMode.wrappedValue.dismiss()}){Image(systemName: "arrow.left").foregroundColor(.black)}
            ).navigationBarTitleDisplayMode(.inline).navigationTitle("Escolha um pokemon")
        }.navigationBarHidden(true).navigationViewStyle(StackNavigationViewStyle()).frame(maxWidth: .infinity, maxHeight: .infinity)
    }
     
    
    init(back: Binding<Bool>) {
        UITableView.appearance().backgroundColor = .clear // For tableView
        UITableViewCell.appearance().backgroundColor = .clear // For tableViewCell
        _back = back
    }
}


/*struct EscolherPokemon_Previews: PreviewProvider {
    static var previews: some View {
        EscolherPokemon()
    }
}*/
