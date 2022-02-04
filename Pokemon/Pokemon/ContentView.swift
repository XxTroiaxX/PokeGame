//
//  ContentView.swift
//  Pokemon
//
//  Created by Pedro Magalhães Troia on 18/12/2021.
//

import SwiftUI
import UIKit


struct ContentView: View {
    @State var backtoroot:Bool = false
    @State var backtorootjogo:Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                Image("background").resizable().edgesIgnoringSafeArea(.all)
                VStack() {
                    Spacer()
                    Image("Pokemon-Logo").resizable().scaledToFit().frame(width:300)
                    VStack(){

                        NavigationLink(destination: EscolherPokemon(back: $backtorootjogo),isActive: $backtorootjogo) {
                            Text("Jogar").frame(width: 300, height: 50).background(Color.init(UIColor().colorFromEx("#1a5dab"))).foregroundColor(.white)
                        }.cornerRadius(10)
                        
                        NavigationLink(destination: Pokedex(backtoroot: $backtoroot),isActive: $backtoroot) {
                            Text("Pokedex").frame(width: 300, height: 50).background(Color.init(UIColor().colorFromEx("#1a5dab"))).foregroundColor(.white)
                        }.cornerRadius(10)
                        
                        NavigationLink(destination: Historico()) {
                            Text("Histórico").frame(width: 300, height: 50).background(Color.init(UIColor().colorFromEx("#1a5dab"))).foregroundColor(.white)
                        }.cornerRadius(10)
                        
                        Button(action: {exit(0)}){
                            Text("Sair").frame(width: 300, height: 50).background(Color.init(UIColor().colorFromEx("#1a5dab"))).foregroundColor(.white)
                        }.cornerRadius(10)
                    }
                    Spacer()
                    Spacer()
                }.frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .top
                ).navigationBarHidden(true).edgesIgnoringSafeArea(.all)
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
