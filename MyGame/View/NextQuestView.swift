//
//  richestView.swift
//  MyGame
//
//  Created by kxx: on 2023/02/24.
//

import SwiftUI

struct NextQuestView: View {
    
    @EnvironmentObject private var vm: MainViewModel
    
    
    @Binding var fullScreen: Bool
    @State var TextFieldText: String = ""
    @State private var showTextField: Bool = true
    
    var body: some View {
            VStack(alignment: .leading) {
                if showTextField {
                    fieldBar
                } else {
                    headerBtn
                }

                listView
                    
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct NextQuestView_Previews: PreviewProvider {
    static var previews: some View {
        Main()
            .environmentObject(MainViewModel())
    }
}

extension NextQuestView {
    private var headerBtn: some View {
        HStack {
            Button {
                fullScreen.toggle()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.gray)
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(6)
            }
            
            Spacer()
            
            Image(systemName: "plus")
                .foregroundColor(.blue)
                .font(.title3)
                .fontWeight(.bold)
                .padding(6)
        }
        .padding()
    }
    
    private var fieldBar: some View {
        HStack {
            TextField("내용을 입력해주세요", text: $TextFieldText)
                .padding(.horizontal)
                .background {
                    RoundedRectangle(cornerRadius: 10).stroke()
                        .foregroundColor(.gray)
                }
            
            Button {
                showTextField.toggle()
            } label: {
                Text("Submit")
                    .padding(.horizontal, 6)
                    .background {
                        
                    }
            }
        }
        .padding(.horizontal)
    }
    
    private var listView: some View {
        List {
            Text("next quest".capitalized)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom)
                .foregroundColor(.blue)
                .listRowSeparator(.hidden)
            
            ForEach(vm.dataArray, id: \.self) { datas in
                Text(datas)
                    .padding(.bottom)
            }
        }
        .listStyle(PlainListStyle())
    }
}
