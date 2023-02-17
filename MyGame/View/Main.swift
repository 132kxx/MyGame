//
//  Main.swift
//  MyGame
//
//  Created by kxx: on 2023/02/17.
//

import SwiftUI

struct Main: View {
    
    var body: some View {
        VStack {
            //hline: indicator
            HStack {
                Text("클래스 ?????")
                Spacer()
                Text("전투력 9999")
            }
            .fontWeight(.bold)
            .padding(.horizontal, 50)
            .padding(.bottom, 50)
            
            //profile: Image
            Image(systemName: "person.fill")
                .data(url: URL(string: "https://images.unsplash.com/photo-1551103782-8ab07afd45c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80")!)
                .clipShape(RoundedRectangle(cornerRadius: 80))
                .frame(width: 250, height: 250)
                .shadow(radius: 10)
                .scaledToFit()
                .padding(.bottom, 30)
            
            //buttons
            HStack(alignment: .center, spacing: 50) {
                Image(systemName: "doc")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                Image(systemName: "trophy")
                    .resizable()
                    .frame(width: 50, height: 50)
                Image(systemName: "xmark.bin")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding(.bottom, 40)

            //next quest indicator
            Text("다음퀘스트: ??????")
                .frame(maxWidth: .infinity, alignment: .center)
            
            //activities

                
            
            
            
            
            
            Spacer()
        }
    }
}

extension Image {
    func data(url: URL) -> Self {
        if let data = try?  Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
