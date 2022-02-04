//
//  Ecras.swift
//  Pokemon
//
//  Created by Pedro Magalhães Troia on 24/01/2022.
//

import SwiftUI
import Kingfisher

struct Ecras: View {
    
    @Binding var amigo:PokemonData
    @Binding var inimigo:PokemonData
    
    @Binding var attemptsAmigo:Int
    @Binding var attemptsInimigo:Int
    
    var body: some View {
        HStack{
            VStack{
                VStack{
                    HStack{
                        Text(inimigo.PokeName).minimumScaleFactor(0.01)
                        Spacer()
                        Text("Lvl \(inimigo.Nivel)").minimumScaleFactor(0.01)
                    }.padding(.bottom, 1)
                    ProgressView(value:Float(inimigo.PokeVida), total: Float(inimigo.VidaAtual)!)
                    {
                        Text("HP").font(.footnote).frame(alignment: .trailing).minimumScaleFactor(0.01)
                    }
                    Text("\(inimigo.PokeVida)/\(inimigo.VidaAtual)").frame(maxWidth: .infinity,alignment: .trailing).font(.system(size: 10)).minimumScaleFactor(0.01)
                }.padding()
            }.frame(maxWidth: .infinity).background(Color.white).cornerRadius(10)
            KFImage(URL(string: inimigo.PokeFoto)!).resizable().scaledToFit().frame(maxWidth: 140, maxHeight: 140).modifier(Shake(animatableData: CGFloat(attemptsInimigo)))
        }
        HStack{
            KFImage(URL(string: amigo.PokeFoto)!).resizable().scaledToFit().frame(maxWidth: 140, maxHeight: 140).modifier(Shake(animatableData: CGFloat(attemptsAmigo)))
            VStack{
                VStack{
                    HStack{
                        Text(amigo.PokeName).minimumScaleFactor(0.01)
                        Spacer()
                        Text("Lvl \(amigo.Nivel)").minimumScaleFactor(0.01)
                    }.padding(.bottom, 1)
                    ProgressView(value:Float(amigo.PokeVida), total: Float(amigo.VidaAtual)!)
                    {
                        Text("HP").font(.footnote).frame(alignment: .trailing).minimumScaleFactor(0.01)
                    }
                    Text("\(amigo.PokeVida)/\(amigo.VidaAtual)").frame(maxWidth: .infinity,alignment: .trailing).font(.system(size: 10)).minimumScaleFactor(0.01)
                }.padding()
            }.frame(maxWidth: .infinity).background(Color.white).cornerRadius(10)
        }
    }
}

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}

/*struct Ecras_Previews: PreviewProvider {
    static var previews: some View {
        Ecras()
    }
}*/
