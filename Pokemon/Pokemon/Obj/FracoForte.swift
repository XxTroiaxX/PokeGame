import Foundation

struct FracoForte{
    var Forte:[String: [String]] = [
        "Agua": ["Terra","Pedra","Fogo"],
        "Fogo": ["Inseto","Metálico","Planta","Gelo"],
        "Dragão": ["Dragão"],
        "Elétrico": ["Voador","Agua"],
        "Fada": ["Lutador","Dragão","Noturno"],
        "Fantasma": ["Fantasma","Psíquico"],
        "Gelo": ["Voador","Terra","Planta","Dragão"],
        "Lutador": ["Normal","Pedra","Metálico","Gelo","Noturno"],
        "Metálico": ["Pedra","Gelo","Fada"],
        "Noturno": ["Fantasma","Psíquico"],
        "Pedra": ["Voador","Inseto","Fogo","Gelo"],
        "Psíquico": ["Lutador","Venenoso"],
        "Terra": ["Venenoso","Pedra","Metálico","Fogo","Elétrico"],
        "Inseto": ["Planta","Psíquico","Noturno"],
        "Normal": [""],
        "Planta": ["Terra","Pedra","Agua"],
        "Venenoso": ["Planta","Fada"],
        "Voador": ["Lutador","Inseto","Planta"]
    ]
    
    
    var Fraco:[String: [String]] = [
        "Agua": ["Planta","Elétrico"],
        "Fogo": ["Agua","Terra","Pedra"],
        "Dragão": ["Gelo","Fada","Dragão"],
        "Elétrico": ["Terra"],
        "Fada": ["Venenoso","Metálico"],
        "Fantasma": ["Fantasma","Noturno"],
        "Gelo": ["Fogo","Pedra","Lutador","Metálico"],
        "Lutador": ["Voador","Psíquico","Fada"],
        "Metálico": ["Fogo","Terra","Lutador"],
        "Noturno": ["Lutador","Inseto","Fada"],
        "Pedra": ["Psíquico","Fada"],
        "Psíquico": ["Inseto","Fantasma","Noturno"],
        "Terra": ["Agua","Planta","Gelo"],
        "Inseto": ["Fogo","Voador","Pedro"],
        "Normal": ["Lutador"],
        "Planta": ["Fogo","Voador","Gelo","Venenoso","Inseto"],
        "Venenoso": ["Terrestre","Psíquico"],
        "Voador": ["Elétrico","Pedra","Gelo"]
    ]
}
