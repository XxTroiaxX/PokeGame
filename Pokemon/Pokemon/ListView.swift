//
//  ListView.swift
//  Pokemon
//
//  Created by Pedro Magalhães Troia on 24/12/2021.
//

import SwiftUI
import Kingfisher

struct ListView: View {
    @State var poke:PokemonData
    var body: some View {
        HStack{
            KFImage(URL(string: self.poke.PokeFoto)!).resizable().padding(5).scaledToFit().frame(maxWidth: 90,maxHeight: 90)
            VStack{
                Text(self.poke.PokeName).foregroundColor(Color.black)
                ProgressView(value:Float(self.poke.NivelXP), total: 100.0)
                {
                    Text("Nivel: \(self.poke.Nivel)").font(.footnote)
                }.padding(1)
            }.frame(maxWidth: .infinity,alignment: .center)
        }
    }
}
