//
//  Historico.swift
//  Pokemon
//
//  Created by Pedro Magalhães Troia on 31/01/2022.
//

import SwiftUI
import Kingfisher

struct Historico: View {
    @StateObject var hist = GetHistorico()
    @Environment (\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView{
            ZStack{
                Image("background").resizable().edgesIgnoringSafeArea(.all)
                VStack{
                    List {
                        Section {
                            ForEach(hist.histpoke, id: \.self){ hist in
                                HStack{
                                    VStack{
                                        KFImage(URL(string: hist.Amigo.PokeFoto)!).resizable().padding(5).scaledToFit().frame(maxWidth: 90,maxHeight: 90)
                                    }
                                    
                                    VStack{
                                        Text(hist.Estado).foregroundColor(Color.black)
                                    }.frame(maxWidth: .infinity,alignment: .center)
                                    VStack{
                                        KFImage(URL(string: hist.Inimigo.PokeFoto)!).resizable().padding(5).scaledToFit().frame(maxWidth: 90,maxHeight: 90)
                                    }
                                }.listRowSeparator(.hidden)
                            }
                        }
                    }
                }.frame(maxHeight: .infinity,alignment: .top)
            }.navigationBarItems(
                leading: Button(action:{presentationMode.wrappedValue.dismiss()}){Image(systemName: "arrow.left").foregroundColor(.black)}
            ).navigationBarTitleDisplayMode(.inline).navigationTitle("Histórico")
        }.navigationBarHidden(true).navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Historico_Previews: PreviewProvider {
    static var previews: some View {
        Historico()
    }
}
