//
//  richestView.swift
//  MyGame
//
//  Created by kxx: on 2023/02/24.
//

import SwiftUI

struct NextQuestView: View {
    
    @EnvironmentObject private var vm: MainViewModel
    @Binding var questFieldText: String
    
    
    @Binding var fullScreen: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Button {
                    fullScreen.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

                Text("next quest".capitalized)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundColor(.blue)
                
                List {
                    ForEach(vm.dataArray, id: \.self) { datas in
                        Text(datas)
                            .padding(.bottom)
                    }
                }
                .listStyle(PlainListStyle())
                    
                
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        
    }
}

struct NextQuestView_Previews: PreviewProvider {
    static var previews: some View {
        Main()
            .environmentObject(MainViewModel())
    }
}
