//
//  editpokemon.swift
//  Pokemon
//
//  Created by Pedro Magalhães Troia on 27/12/2021.
//

import SwiftUI
import UIKit
import Kingfisher


struct editpokemon: View{
        
    @Binding var back:Bool
        
    @State var pokemonType: String
    @State var pokemonData: PokemonData
    @State var pokemonAtacks:[PokemonAtacks]
    @State var AllTypes:[ResultType]
    
    @State private var isShowingPhotoPicker = false
    @State private var imageimg = UIImage(named: "noimg")!
    
    @State private var DeletePoke = DeletePokemon()
    
    @State private var showingAlert = false
    @State private var showingAlerrError = false
    
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
                                AsyncImage(url: URL(string: pokemonData.PokeFoto)) { phase in
                                    switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            if(imageimg != UIImage(named: "noimg")){
                                                Image(uiImage: imageimg).resizable().scaledToFit().frame(width: 140, height: 140)
                                            }else{
                                                image.resizable().scaledToFit().frame(width: 140, height: 140)
                                            }
                                        case .failure:
                                            Image(uiImage: imageimg).resizable().scaledToFit().frame(width: 140, height: 140)
                                        @unknown default:
                                            EmptyView()
                                    }
                                }.onTapGesture{
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
                    
                        Button(action: {
                            
                            let edit = PostEdit(pokemontype: pokemonType, pokemondata: pokemonData, pokemonatacks: pokemonAtacks, imgr: imageimg)
                            let errors = edit.checkifnull()
                            
                            if(!errors.isEmpty){
                                showingAlerrError = true
                                ErrorMsg = errors
                            }else{
                                showingAlerrError = false
                                ErrorMsg = ""
                                edit.Update()
                                back = false
                            }
                        }){
                            Text("Editar").frame(maxWidth: .infinity,alignment: .center).padding().background(Color.init(UIColor().colorFromEx("#1a5dab"))).cornerRadius(10).foregroundColor(.white)
                        }.listRowBackground(Color.clear).alert(ErrorMsg,isPresented: $showingAlerrError) {
                            Button("Percebido", role: .cancel) { }
                        }
                    }
                }.frame(maxHeight: .infinity,alignment: .top)
            }.navigationBarItems(
                leading: Button(action:{presentationMode.wrappedValue.dismiss()}){Image(systemName: "arrow.left").foregroundColor(.black)},
                trailing:  Button(action:{showingAlert = true}){Image(systemName: "trash").alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Tem a certeza que quer eliminar?"),
                        message: Text("Se elimnar, não tem forma de voltar atrás"),
                        primaryButton: .destructive(Text("Eliminar")) {
                            DeletePoke.Delete(id: pokemonData.IDPokedex)
                            back = false
                        },
                        secondaryButton: .cancel(Text("Cancelar"))
                    )
                }.foregroundColor(.black)}
            ).navigationBarTitleDisplayMode(.inline).navigationTitle(pokemonData.PokeName)
        }.navigationBarHidden(true).navigationViewStyle(StackNavigationViewStyle()).sheet(isPresented: $isShowingPhotoPicker, content: {
            PhotoPicker(imageedit: $imageimg)
        })
    }
    
    init(type: String, data: PokemonData, atacks: [PokemonAtacks],types:[ResultType], teste: Binding<Bool>) {
        UITableView.appearance().backgroundColor = .clear // For tableView
        UITableViewCell.appearance().backgroundColor = .clear // For tableViewCell

        _pokemonType = State(initialValue: type)
        _pokemonData = State(initialValue: data)
        _pokemonAtacks = State(initialValue: atacks)
        _AllTypes = State(initialValue: types)
        _back = teste
    }
}

/*struct editpokemon_Previews: PreviewProvider {
    static var previews: some View {
        //editpokemon(id: 0)
    }
}*/
