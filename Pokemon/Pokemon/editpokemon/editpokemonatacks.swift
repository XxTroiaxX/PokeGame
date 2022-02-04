//
//  editpokemonatacks.swift
//  Pokemon
//
//  Created by Pedro Magalhães Troia on 29/12/2021.
//

import SwiftUI

struct editpokemonatacks: View {
    @Binding var PokemonaAtacks:[PokemonAtacks]
    
    var body: some View {
            Section(header: Text("Ataques1").bold().foregroundColor(Color.black).font(.system(size: 18))){
                VStack{
                    Text("Nome do ataque").bold().frame(maxWidth: .infinity, alignment: .leading).font(.system(size: 15))
                    TextField("Ataque...",text: $PokemonaAtacks[0].Ataque).padding(8).background(Color.white).cornerRadius(10).multilineTextAlignment(.center)
                    
                    Text("Dano do ataque").bold().frame(maxWidth: .infinity, alignment: .leading).font(.system(size: 15))
                    TextField("Dano...",text: $PokemonaAtacks[0].Dano).padding(8).background(Color.white).cornerRadius(10).multilineTextAlignment(.center).keyboardType(.numberPad)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }.frame(height: .none).listRowBackground(Color.clear)
        
            Section(header: Text("Ataques2").bold().foregroundColor(Color.black).font(.system(size: 18))){
                VStack{
                    Text("Nome do ataque").bold().frame(maxWidth: .infinity, alignment: .leading).font(.system(size: 15))
                    TextField("Ataque...",text: $PokemonaAtacks[1].Ataque).padding(8).background(Color.white).cornerRadius(10).multilineTextAlignment(.center)
                    
                    Text("Dano do ataque").bold().frame(maxWidth: .infinity, alignment: .leading).font(.system(size: 15))
                    TextField("Dano...",text: $PokemonaAtacks[1].Dano).padding(8).background(Color.white).cornerRadius(10).multilineTextAlignment(.center).keyboardType(.numberPad)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }.frame(height: .none).listRowBackground(Color.clear)
            
            Section(header: Text("Ataques3").bold().foregroundColor(Color.black).font(.system(size: 18))){
                VStack{
                    
        
                    Text("Nome do ataque").bold().frame(maxWidth: .infinity, alignment: .leading).font(.system(size: 15))
                    TextField("Ataque...",text: $PokemonaAtacks[2].Ataque).padding(8).background(Color.white).cornerRadius(10).multilineTextAlignment(.center)
                    
                    Text("Dano do ataque").bold().frame(maxWidth: .infinity, alignment: .leading).font(.system(size: 15))
                    TextField("Dano...",text: $PokemonaAtacks[2].Dano).padding(8).background(Color.white).cornerRadius(10).multilineTextAlignment(.center).keyboardType(.numberPad)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }.frame(height: .none).listRowBackground(Color.clear)
            
            Section(header: Text("Ataques4").bold().foregroundColor(Color.black).font(.system(size: 18))){
                VStack{
                    Text("Nome do ataque").bold().frame(maxWidth: .infinity, alignment: .leading).font(.system(size: 15))
                    TextField("Ataque...",text: $PokemonaAtacks[3].Ataque).padding(8).background(Color.white).cornerRadius(10).multilineTextAlignment(.center)
                    
                    Text("Dano do ataque").bold().frame(maxWidth: .infinity, alignment: .leading).font(.system(size: 15))
                    TextField("Dano...",text: $PokemonaAtacks[3].Dano).padding(8).background(Color.white).cornerRadius(10).multilineTextAlignment(.center)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }.frame(height: .none).listRowBackground(Color.clear)
        
    }
    
}


