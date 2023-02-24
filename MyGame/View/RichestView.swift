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
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(systemName: "xmark")
                    .foregroundColor(.blue)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .background {
                        Circle()
                            .stroke(lineWidth: 3)
                            .foregroundColor(.blue)
                    }
                
                Text("activity".capitalized)
                    .font(.title)
                    .padding()
                    .multilineTextAlignment(.leading)
                    .underline()
                
                ForEach(dataArray, id: \.self) { datas in
                    Text(datas)
                        .padding(.bottom)
                }
                    
                
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        
    }
}

struct RichestView_Previews: PreviewProvider {
    static var previews: some View {
        RichestView()
    }
}
