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
    @State private var showTextField: Bool = false
    
    var body: some View {
            VStack(alignment: .leading) {
                if showTextField {
                    textFieldView
                } else {
                    headerView
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
    private var headerView: some View {
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
                
                Button {
                    showTextField.toggle()
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(6)
                }
            }
            .padding(.horizontal)
            .frame(height: 50)
        }
    
    private var textFieldView: some View {
        HStack {
            TextField("내용을 입력해주세요", text: $TextFieldText)
                .padding(.vertical, 6)
                .background {
                    RoundedRectangle(cornerRadius: 10).stroke()
                        .foregroundColor(.gray)
                }
            
            Button {
                showTextField.toggle()
                vm.addDataArray(quest: TextFieldText)
                TextFieldText = ""
            } label: {
                Text("Add")
                    .foregroundColor(.white)
                    .padding(6)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                    }
            }
        }
        .padding(.horizontal)
        .frame(height: 50)

    }

    

    
    private var listView: some View {
        List {
            Text("next quest".capitalized)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom)
                .foregroundColor(.blue)
                .listRowSeparator(.hidden)
            
            ForEach(vm.quest) { element in
                if element.isFinished == false {
                    Text(element.task)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom)
                        .onTapGesture {
                            vm.editFinish(element: element)
                        }
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}
