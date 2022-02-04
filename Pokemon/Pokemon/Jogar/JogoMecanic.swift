import Foundation
import SwiftUI




struct Mecanica{
    
    @Binding var DataAmigo: PokemonData
    @Binding var DataInimigo: PokemonData
    
    @State var AtaqueAmigo: PokemonAtacks
    @State var AtaquesInimigo: [PokemonAtacks]
    
    @Binding var mensagem:String
    @Binding var Comecou:Bool
    
    @Binding var attemptsAmigo:Int
    @Binding var attemptsInimigo:Int
    
    @Binding var bloqueados:Bool
    @Binding var Alert:Bool
    
    func atacar() -> Void{
        let insert = PostResult()
        if(Comecou){
            bloqueados = true
            withAnimation(.default) {
               self.attemptsInimigo += 1
            }
            
            if(ataqueAmigo() == "Ganhou"){
                insert.InsertHist(Amigo: DataAmigo.IDPokedex, Inimigo: DataInimigo.IDPokedex, Estado: "Ganhou", Nivel: DataAmigo.Nivel, NivelXP: DataAmigo.NivelXP, Vida: DataAmigo.VidaAtual)
                mensagem = "Ganhou o jogo!"
                bloqueados = true
                Alert = true
                return;
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                withAnimation(.default) {
                   self.attemptsAmigo += 1
                }
                
                if(ataqueInimigo() == "Perdeu"){
                    insert.InsertHist(Amigo: DataAmigo.IDPokedex, Inimigo: DataInimigo.IDPokedex, Estado: "Perdeu", Nivel: DataInimigo.Nivel, NivelXP: DataInimigo.NivelXP, Vida:  DataInimigo.VidaAtual)
                    mensagem = "Perdeu o jogo!"
                    bloqueados = true
                    Alert = true
                    return;
                }
                bloqueados = false;
            }
        }else{
            Comecou = true
            mensagem = "Ataque o \(DataInimigo.PokeName)"
        }
    }
    
    func ataqueAmigo() -> String {
        print("Ataqueusa: \(AtaqueAmigo.Dano)")
        if(ataqueplus(pokemonAmigo: DataAmigo, pokemonInimigo: DataInimigo)){
            DataInimigo.PokeVida = String(Int(DataInimigo.PokeVida)! - (Int(AtaqueAmigo.Dano)! + (Int(AtaqueAmigo.Dano)! * 30)/100))
            mensagem = "Ataque super efetivo!"
        }else if(ataqueminus(pokemonAmigo: DataAmigo, pokemonInimigo: DataInimigo)){
            DataInimigo.PokeVida = String(Int(DataInimigo.PokeVida)! - (Int(AtaqueAmigo.Dano)! - (Int(AtaqueAmigo.Dano)! * 30)/100))
            mensagem = "Ataque fraco!"
        }else{
            DataInimigo.PokeVida = String(Int(DataInimigo.PokeVida)! - Int(AtaqueAmigo.Dano)!)
            mensagem = "\(DataAmigo.PokeName) usou o ataque \(AtaqueAmigo.Ataque)"
        }
        
        if(Int(DataInimigo.PokeVida)! <= 0){
            DataInimigo.PokeVida = "0";
            return "Ganhou"
        }else{
            return "Continua"
        }
    }
    
    func ataqueInimigo() -> String{
        let randomatack:Int = Int.random(in: 0...3)
        let atack:PokemonAtacks = AtaquesInimigo[randomatack]
        let atackusado:Int = Int(atack.Dano)!
        
        print("Ataqueusa1: \(randomatack), \(atackusado)")
        
        
        if(ataqueplus(pokemonAmigo: DataInimigo, pokemonInimigo: DataAmigo)){
            DataAmigo.PokeVida = String(Int(DataAmigo.PokeVida)! - (atackusado + (atackusado * 30)/100))
            mensagem = "\(DataInimigo.PokeName) usou um ataque super efetivo!"
        }else if(ataqueminus(pokemonAmigo: DataInimigo, pokemonInimigo: DataAmigo)){
            DataAmigo.PokeVida = String(Int(DataAmigo.PokeVida)! - (atackusado - (atackusado * 30)/100))
            mensagem = "\(DataInimigo.PokeName) usou um ataque fraco!"
        }else{
            DataAmigo.PokeVida = String(Int(DataAmigo.PokeVida)! - atackusado)
            mensagem = "\(DataInimigo.PokeName) usou o ataque \(atack.Ataque)"
        }
        
        if(Int(DataAmigo.PokeVida)! <= 0){
            DataAmigo.PokeVida = "0";
            return "Perdeu"
        }else{
            return "Continua"
        }
    }
    
    
    func ataqueplus(pokemonAmigo:PokemonData,pokemonInimigo:PokemonData) -> Bool{
        let forte = FracoForte()
        let tiposfortes = forte.Forte[pokemonAmigo.TypePoke]!

        for tipos in tiposfortes{
            if(pokemonInimigo.TypePoke == tipos){
                return true
            }
        }
        return false
    }
    
    func ataqueminus(pokemonAmigo:PokemonData,pokemonInimigo:PokemonData) -> Bool{
        let fraco = FracoForte()
        let tiposfracos = fraco.Fraco[pokemonAmigo.TypePoke]!

        for tipos in tiposfracos{
            if(pokemonInimigo.TypePoke == tipos){
                return true
            }
        }
        return false
    }
}
