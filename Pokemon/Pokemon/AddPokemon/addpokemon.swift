//
//  addpokemon.swift
//  Pokemon
//
//  Created by Pedro Magalhães Troia on 16/01/2022.
//

import SwiftUI

struct addpokemon: View {
    
    @Binding var back:Bool
    
    @State var pokemonType: String = "Selecionar"
    @State var pokemonData: PokemonData = PokemonData(IDPokedex: 0, PokeName: "", PokeVida: "100",VidaAtual: "", PokeFoto: "",TypePoke: "", Nivel: 1, NivelXP: 0)
    @State var pokemonAtacks:[PokemonAtacks] = [PokemonAtacks(Ataque: "", Dano: ""),PokemonAtacks(Ataque: "", Dano: ""),PokemonAtacks(Ataque: "", Dano: ""),PokemonAtacks(Ataque: "", Dano: "")]
    @State var AllTypes:[ResultType]
    
    @State private var isShowingPhotoPicker = false
    @State private var imageimg = UIImage(named: "noimg")!
    
    @State private var showingAlert = false
    
    @State private var ErrorMsg:String = ""
    
    @Environment (\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView{
            ZStack{
                Image("background").resizable().edgesIgnoringSafeArea(.all)
                VStack{
                    List{
                        Section(header: Text("Imagem do Pokemon").bold().foregroundColor(Color.black).font(.system(size: 18))){
                            VStack{
                                Image(uiImage: imageimg).resizable().scaledToFit().frame(width: 140, height: 140).onTapGesture{
                                    isShowingPhotoPicker = true
                                }
                            }.frame(maxWidth: .infinity, alignment: .center).listRowBackground(Color.clear)
                        }
                        
                        ProgressView(value:Float(pokemonData.NivelXP), total: 100.0)
                        {
                            Text("Nivel: \(pokemonData.Nivel)").font(.footnote).frame(maxWidth: .infinity, alignment: .center)
                        }.padding(1).listRowBackground(Color.clear)
                        
                        Section(header: Text("Nome do Pokemon").bold().foregroundColor(Color.black).font(.system(size: 18))){
                            VStack{
                                TextField("Nome pokemon",text: $pokemonData.PokeName).padding(8).background(Color.white).cornerRadius(10).multilineTextAlignment(.center)
                            }.frame(maxWidth: .infinity, alignment: .center)
                        }.frame(height: .none).listRowBackground(Color.clear)
                        
                        Section(header: Text("Vida do pokemon").bold().foregroundColor(Color.black).font(.system(size: 18))){
                            VStack{
                                TextField("Vida pokemon",text: $pokemonData.PokeVida).padding(8).background(Color.white).cornerRadius(10).multilineTextAlignment(.center).disabled(true)
                            }.frame(maxWidth: .infinity, alignment: .center)
                        }.frame(height: .none).listRowBackground(Color.clear)
                        
                        Section(header: Text("Tipo do pokemon").bold().foregroundColor(Color.black).font(.system(size: 18))){
                            VStack{
                                Menu{
                                    Picker(selection: $pokemonType, label: EmptyView()) {
                                        ForEach(AllTypes, id: \.self){ atacks in
                                            ForEach(atacks.types, id: \.self){ atacks1 in
                                                Text(atacks1.TypePoke).tag(atacks1.TypePoke)
                                            }
                                        }
                                    }
                                }label: {
                                    Text(pokemonType).frame(maxWidth: .infinity).padding(8).foregroundColor(Color.black).background(Color.white).cornerRadius(10).multilineTextAlignment(.center)
                                }
                            }.frame(maxWidth: .infinity, alignment: .center).listRowBackground(Color.clear)
                        }
                        
                        editpokemonatacks(PokemonaAtacks: $pokemonAtacks)
                    }
                }.frame(maxHeight: .infinity,alignment: .top)
            }.navigationBarItems(
                leading: Button(action:{presentationMode.wrappedValue.dismiss()}){Image(systemName: "arrow.left").foregroundColor(.black)},
                trailing:  Button(action: {
                    let edit = InsertPokemon(pokemontype: pokemonType, pokemondata: pokemonData, pokemonatacks: pokemonAtacks, imgr: imageimg)
                    let errors = edit.checkifnull()
                    
                    if(!errors.isEmpty){
                        showingAlert = true
                        ErrorMsg = errors
                    }else{
                        showingAlert = false
                        ErrorMsg = ""
                        edit.Insert()
                        back = false
                    }
                }){Image(systemName: "plus").foregroundColor(.black)}.alert(ErrorMsg,isPresented: $showingAlert) {
                    Button("Percebido", role: .cancel) { }
                }
            ).navigationBarTitleDisplayMode(.inline).navigationTitle(pokemonData.PokeName)
        }.navigationBarHidden(true).navigationViewStyle(StackNavigationViewStyle()).sheet(isPresented: $isShowingPhotoPicker, content: {
            PhotoPicker(imageedit: $imageimg)
        })
    }
    
    init(teste: Binding<Bool>, types:[ResultType]) {
        UITableView.appearance().backgroundColor = .clear // For tableView
        UITableViewCell.appearance().backgroundColor = .clear // For tableViewCell

        
        _AllTypes = State(initialValue: types)
        _back = teste
       
    }
}

/*struct addpokemon_Previews: PreviewProvider {
    static var previews: some View {
        addpokemon()
    }
}*/
