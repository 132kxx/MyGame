//
//  richestView.swift
//  MyGame
//
//  Created by kxx: on 2023/02/24.
//

import SwiftUI

struct RichestView: View {
    
    var dataArray: [String] = [
        "complete task",
        "drink water",
        "세무사공부하기?",
        "개발자되기"
    ]
    
    @Binding var showScreen: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Button {
                    showScreen.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

                Text("activity".capitalized)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundColor(.blue)
                
                List {
                    ForEach(dataArray, id: \.self) { datas in
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

struct RichestView_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
