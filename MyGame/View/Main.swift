//
//  Main.swift
//  MyGame
//
//  Created by kxx: on 2023/02/17.
//

import SwiftUI

struct Main: View {
    
    @State var showScreen: Bool = false
    
    var body: some View {
        VStack {
            //hline: indicator
            HStack {
                Text("CLASS ?????")
                Spacer()
                Text("POWER 9999")
                }
                .fontWeight(.bold)
                .padding(.horizontal, 50)
                .padding(.bottom, 50)
                
            //profile: Image
            Image(systemName: "person.fill")
                .data(url: URL(string: "https://pbs.twimg.com/media/FlwG8luXgAAKj1Z.jpg")!)
                .clipShape(RoundedRectangle(cornerRadius: 80))
                .frame(width: 250, height: 250)
                .shadow(radius: 10)
                .scaledToFit()
                .padding(.bottom, 30)
            
            //buttons
            HStack(alignment: .bottom, spacing: 50) {
                Button {
                    showScreen.toggle()
                } label: {
                    VStack {
                        Image(systemName: "doc")
                        Text("Previous")
                    }
                    .font(.title2)
                    .shadow(radius: 10)
                }

                Button {
                    showScreen.toggle()
                } label: {
                    VStack {
                        Image(systemName: "trophy")
                        Text("trophy")
                    }
                    .font(.title2)
                    .shadow(radius: 10)
                }
                .fullScreenCover(isPresented: $showScreen) {
                    RichestView()
                }
                
                
                Button {
                    showScreen.toggle()
                } label: {
                    VStack {
                        Image(systemName: "xmark.bin")
                        Text("Delete")
                    }
                    .font(.title2)
                    .shadow(radius: 10)
                }
            }
            .padding(.bottom, 40)
            .tint(.black)
            

            //next quest indicator
            Text("Next Quest: ??????")
                .frame(maxWidth: .infinity, alignment: .center)
            
            //activities
            ScrollView {
                VStack(alignment: .leading) {
                        Text("2월 19일")
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 30)

                        HStack {
                            Circle()
                                .frame(width: 50)
                                .overlay {
                                    Text("+5")
                                        .foregroundColor(.white)
                                }
                            Text("complete lect")
                            
                            Spacer()
                    }
                        .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                }
                .padding(.bottom, 20)
                
                VStack(alignment: .leading) {
                        Text("2월 18일")
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 30)

                        HStack {
                            Circle()
                                .frame(width: 50)
                                .overlay {
                                    Text("+3")
                                        .foregroundColor(.white)
                                }
                            Text("target complete")
                            
                            Spacer()
                    }
                        .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                }
                .padding(.bottom, 20)
            }
                
            
            
            
            
            
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
