//
//  Jogar.swift
//  Pokemon
//
//  Created by Pedro Magalhães Troia on 24/01/2022.
//

import SwiftUI

struct Jogar: View {
    @State var pokemonDataAmigo: PokemonData
    @State var pokemonAtacksAmigo:[PokemonAtacks]
    
    @State var pokemonDataInimigo: PokemonData
    @State var pokemonAtacksInimigo:[PokemonAtacks]
    
    @State var msg:String = "Clique num ataque para começar!";
    @State var jogocomecou:Bool = false
    
    @State var attemptsAmigo: Int = 0
    @State var attemptsInimigo:Int = 0
    
    @State var atacksbloqueados:Bool = false
    @State var showingAlert:Bool = false
    @State var showingAlertFugir:Bool = false
    
    @Binding var back:Bool

    @Environment (\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView{
            ZStack{
                Image("background").resizable().edgesIgnoringSafeArea(.all)
                VStack{
                    VStack{
                        Text(msg).minimumScaleFactor(0.01)
                        Ecras(amigo: $pokemonDataAmigo, inimigo: $pokemonDataInimigo, attemptsAmigo: $attemptsAmigo, attemptsInimigo: $attemptsInimigo)
                    }.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .center).padding()
                    VStack{
                        HStack{
                            Button(action:{
                                print("data: ", pokemonDataInimigo)
                                print("ataques: ", pokemonAtacksInimigo)
                                let mecanic = Mecanica(DataAmigo: $pokemonDataAmigo, DataInimigo: $pokemonDataInimigo, AtaqueAmigo: pokemonAtacksAmigo[0], AtaquesInimigo: pokemonAtacksInimigo,mensagem: $msg, Comecou: $jogocomecou, attemptsAmigo: $attemptsAmigo, attemptsInimigo: $attemptsInimigo, bloqueados: $atacksbloqueados, Alert: $showingAlert)
                                mecanic.atacar()
                                
                            }){
                                Text(pokemonAtacksAmigo[0].Ataque).frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.init(UIColor().colorFromEx("#1a5dab"))).foregroundColor(.white).minimumScaleFactor(0.01)
                            }.cornerRadius(10).disabled(atacksbloqueados)
                            Button(action:{
                                let mecanic = Mecanica(DataAmigo: $pokemonDataAmigo, DataInimigo: $pokemonDataInimigo, AtaqueAmigo: pokemonAtacksAmigo[1], AtaquesInimigo: pokemonAtacksInimigo,mensagem: $msg, Comecou: $jogocomecou, attemptsAmigo: $attemptsAmigo, attemptsInimigo: $attemptsInimigo, bloqueados: $atacksbloqueados, Alert: $showingAlert)
                                mecanic.atacar()
                            }){
                                Text(pokemonAtacksAmigo[1].Ataque).frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.init(UIColor().colorFromEx("#1a5dab"))).foregroundColor(.white).minimumScaleFactor(0.01)
                            }.cornerRadius(10).disabled(atacksbloqueados)
                        }
                        HStack{
                            Button(action:{
                                let mecanic = Mecanica(DataAmigo: $pokemonDataAmigo, DataInimigo: $pokemonDataInimigo, AtaqueAmigo: pokemonAtacksAmigo[2], AtaquesInimigo: pokemonAtacksInimigo,mensagem: $msg, Comecou: $jogocomecou, attemptsAmigo: $attemptsAmigo, attemptsInimigo: $attemptsInimigo, bloqueados: $atacksbloqueados, Alert: $showingAlert)
                                mecanic.atacar()
                            }){
                                Text(pokemonAtacksAmigo[2].Ataque).frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.init(UIColor().colorFromEx("#1a5dab"))).foregroundColor(.white).minimumScaleFactor(0.01)
                            }.cornerRadius(10).disabled(atacksbloqueados)
                            Button(action:{
                                let mecanic = Mecanica(DataAmigo: $pokemonDataAmigo, DataInimigo: $pokemonDataInimigo, AtaqueAmigo: pokemonAtacksAmigo[3], AtaquesInimigo: pokemonAtacksInimigo,mensagem: $msg, Comecou: $jogocomecou, attemptsAmigo: $attemptsAmigo, attemptsInimigo: $attemptsInimigo, bloqueados: $atacksbloqueados, Alert: $showingAlert)
                                mecanic.atacar()
                            }){
                                Text(pokemonAtacksAmigo[3].Ataque).frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.init(UIColor().colorFromEx("#1a5dab"))).foregroundColor(.white).minimumScaleFactor(0.01)
                            }.cornerRadius(10).disabled(atacksbloqueados)
                        }
                        HStack{
                            Button(action:{showingAlertFugir = true}){
                                Text("Fugir").frame(maxWidth: .infinity, maxHeight: 60).background(Color.red).foregroundColor(.white)
                            }.cornerRadius(10).disabled(atacksbloqueados).alert(isPresented: $showingAlertFugir) {
                                Alert(
                                    title: Text("Tem a certeza que quer fugir?"),
                                    message: Text("Se fugir, não tem forma de voltar atrás"),
                                    primaryButton: .destructive(Text("Sim")) {
                                        back = false
                                    },
                                    secondaryButton: .cancel(Text("Não"))
                                )
                            }
                        }
                    }.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .center).padding()
                }.alert(msg,isPresented:$showingAlert ) {
                    Button("Retroceder", role: .cancel) {
                        back = false
                    }
                }
            }.navigationBarHidden(true)
        }.navigationBarHidden(true).navigationViewStyle(StackNavigationViewStyle())
    }
    
    
    
    init(dataamigo: PokemonData, ataquesamigo: [PokemonAtacks],dados: [pokedex], back:Binding<Bool>){
        _pokemonDataAmigo = State(initialValue: dataamigo)
        _pokemonAtacksAmigo = State(initialValue: ataquesamigo)
        _back = back
        
        var DataInimigo: PokemonData?
        var AtacksInimigo:[PokemonAtacks] = []
        
        while(true){
            let numerodados:Int = dados.count - 1
            let numrandomdados = Int.random(in: 0...numerodados)
            
            let numspecdados = dados[numrandomdados].Pokemons.count - 1;
            let numrandomspecpokemons = Int.random(in: 0...numspecdados)
            
            DataInimigo = dados[numrandomdados].Pokemons[numrandomspecpokemons].PokemonData[0]
            AtacksInimigo = dados[numrandomdados].Pokemons[numrandomspecpokemons].Atacks
          
            if((DataInimigo!.IDPokedex != dataamigo.IDPokedex) || numerodados == 0){
                break;
            }
        }
        
        _pokemonDataInimigo = State(initialValue: DataInimigo!)
        _pokemonAtacksInimigo = State(initialValue: AtacksInimigo)
        
    }
    
}

/*struct Jogar_Previews: PreviewProvider {
    static var previews: some View {
        Jogar()
    }
}*/
